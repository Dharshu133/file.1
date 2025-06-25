import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoodSelectorPage(),
    );
  }
}
class MoodSelectorPage extends StatefulWidget {
  @override
  _MoodSelectorPageState createState() => _MoodSelectorPageState();
}
class _MoodSelectorPageState extends State<MoodSelectorPage> {
  final List<String> moods = ['happy', 'sad', 'crying', 'disgusted'];
  String? selectedMood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Mood'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: moods.map((mood) {
              final bool isSelected = selectedMood == mood;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMood = mood;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue[100] : Colors.grey[200],
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    mood,
                    style: TextStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.blue[800] : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 40),
          if (selectedMood != null)
            Text(
              'You are feeling $selectedMood!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            )
        ],
      ),
    );
  }
}

