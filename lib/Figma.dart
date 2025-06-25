import 'package:flutter/material.dart';
void main() {
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
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
//home screen notes
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
      'title': 'Productivity Tips',
      'subtitle': 'Targets planned to meet',
      'color': Color(0xFF77DD77)
    },
    {
      'title': 'Meetings',
      'subtitle': 'Checklist',
      'color': Color(0xFFFFFF99)
    },
    {
      'title': 'Font Collection',
      'subtitle': 'Free & open source fonts',
      'color': Color(0xFF42A5F5)
    },
    {
      'title': 'Resource List',
      'subtitle': 'Free & open source apps',
      'color': Color(0xFF4B0082)
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF252525),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
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
        },
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
//note view
class SampleNoteView extends StatelessWidget {
  const SampleNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: const Color(0xFF252525),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Book Review: The Design of Everyday Things by Don Norman\n\n'
          'The Design of Everyday Things is a classic book about usability. '
          'It emphasizes the importance of good design in everyday objects. '
          'It gives tips to designers on how to make their products more user-friendly.\n\n'
          'If you love UX, this is a must-read book with practical design examples!',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
    );
  }
}
//edit screen
class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
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
        padding: const EdgeInsets.all(16),
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
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  hintText: 'Type here...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Discard'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
