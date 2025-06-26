import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  int counter = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Counter App')),
        body: Center(
          child: Text('$counter', style: TextStyle(fontSize: 40)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
void main() => runApp(MyApp());

