import 'package:flutter/material.dart';
void main() {
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF252525),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Roboto')),
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> notes = [
    {
      'title': 'UI concepts worth exploring',
      'subtitle': 'Book Review: The Design of Everyday Things',
      'color': const Color(0xFFFF6EC7)
    },
    {
      'title': 'Book Review',
      'subtitle': 'The Design of Everyday Things by Don Norman',
      'color': const Color(0xFFFF6961)
    },
    {
      'title': 'Animes produced',
      'subtitle': 'Animes produced by ufotable',
      'color': const Color(0xFF77DD77)
    },
    {
      'title': 'Mangas planned',
      'subtitle': 'Mangas planned to read',
      'color': const Color(0xFFFFFF99)
    },
    {
      'title': 'Tweets Collection',
      'subtitle': 'Awesome tweets collection',
      'color': const Color(0xFF42A5F5)
    },
    {
      'title': 'Source apps',
      'subtitle': 'List of Free & open source apps',
      'color': const Color(0xFF4B0082)
    },
  ];
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
  void editNote(int index, String newTitle, String newSubtitle) {
    setState(() {
      notes[index]['title'] = newTitle;
      notes[index]['subtitle'] = newSubtitle;
    });
  }
  void addNote(String title, String subtitle) {
    setState(() {
      notes.add({
        'title': title,
        'subtitle': subtitle,
        'color': Colors.primaries[notes.length % Colors.primaries.length].shade300
      });
    });
  }
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF252525),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isWide ? buildGridView() : buildListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => EditorScreen(onSave: addNote)));
        },
        backgroundColor: const Color(0xFF2E2E2E),
        child: const Icon(Icons.add),
      ),
    );
  }
  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.8,
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return NoteCard(
          note: note,
          onDelete: () => deleteNote(index),
          onEdit: () => showEditDialog(context, index, note),
        );
      },
    );
  }
  Widget buildListView() {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: NoteCard(
            note: note,
            onDelete: () => deleteNote(index),
            onEdit: () => showEditDialog(context, index, note),
          ),
        );
      },
    );
  }
  void showEditDialog(BuildContext context, int index, Map<String, dynamic> note) {
  final titleController = TextEditingController(text: note['title']);
  final subtitleController = TextEditingController(text: note['subtitle']);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Edit Note', style: TextStyle(color: Colors.black)), 
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.black), 
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.black), 
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextField(
              controller: subtitleController,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                labelText: 'Subtitle',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              editNote(index, titleController.text, subtitleController.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, 
              foregroundColor: Colors.white, 
            ),
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
}
class NoteCard extends StatelessWidget {
  final Map<String, dynamic> note;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const NoteCard({super.key, required this.note, required this.onDelete, required this.onEdit});
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: note['color'],
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(note['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(note['subtitle']),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') {
              onEdit();
            } else if (value == 'delete') {
              onDelete();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'edit', child: Text('Edit')),
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SampleNoteView(note: note)));
        },
      ),
    );
  }
}
class SampleNoteView extends StatelessWidget {
  final Map<String, dynamic> note;
  const SampleNoteView({super.key, required this.note});
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 30, 30),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20),
        child: Text(
          '${note['title']}\n\n${note['subtitle']}',
          style: const TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
    );
  }
}
class EditorScreen extends StatelessWidget {
  final Function(String, String) onSave;
  const EditorScreen({super.key, required this.onSave});
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: const Color(0xFF252525),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Type here...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Discard'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onSave(titleController.text, contentController.text);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

