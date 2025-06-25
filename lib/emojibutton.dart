import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EmojiButtonScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class EmojiButtonScreen extends StatelessWidget {
  const EmojiButtonScreen({super.key});
  void _handleEmojiPress(String emojiName) {
    print('Pressed: $emojiName');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emoji Button')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _handleEmojiPress('Happy'),
              child: const Text('Happy', textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () => _handleEmojiPress('Sad'),
              child: const Text('Sad', textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () => _handleEmojiPress('Angry'),
              child: const Text('Angry', textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () => _handleEmojiPress('Cool'),
              child: const Text('Cool', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}

