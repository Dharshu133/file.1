import 'package:flutter/material.dart';
void main(){
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  Widget build(BuildContext context)
  {
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
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<Map<String, dynamic>> notes = const [
    {
      'title': 'UI concepts worth exploring',
      'subtitle': 'Book Review: The Design of Everyday Things',
      'color': Color(0xFFFF6EC7)
    },
    {
      'title': 'Book Review',
      'subtitle': 'The Design of Everyday Things by Don Norman',
      'color': Color(0xFFFF6961)
    },
    {
      'title': 'Animes produced',
      'subtitle': 'Animes produced by ufotable',
      'color': Color(0xFF77DD77)
    },
    {
      'title': 'Manages planned',
      'subtitle': 'Manages planned to read',
      'color': Color(0xFFFFFF99)
    },
    {
      'title': 'tweets Collection',
      'subtitle': 'Awesome tweets collection',
      'color': Color(0xFF42A5F5)
    },
    {
      'title': 'source apps',
      'subtitle': 'List of Free & open source apps',
      'color': Color(0xFF4B0082)
    },
  ];
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF252525),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isWide
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NoteCard(note: note);
                },
              )
            : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NoteCard(note: note),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const EditorScreen()));
        },
        backgroundColor: const Color(0xFF2E2E2E),
        child: const Icon(Icons.add),
      ),
    );
  }
}
class NoteCard extends StatelessWidget {
  final Map<String, dynamic> note;
  const NoteCard({super.key, required this.note});
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
        trailing: const Icon(Icons.more_vert),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SampleNoteView()),
          );
        },
      ),
    );
  }
}
class SampleNoteView extends StatelessWidget 
{
  const SampleNoteView({super.key});
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: const Color(0xFF252525),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20),
        child: const Text(
          'Book Review: The Design of Everyday Things by Don Norman\n\n'
          'The Design of Everyday Things is required for anyone who is interested in user experience.I personally like to reread it every year or two.\n\n'
          'If you know the basics of design better than anyone else, you can apply them flawlessly anywhere',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
    );
  }
}

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});
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
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: () {}),
        ],
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Discard'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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

