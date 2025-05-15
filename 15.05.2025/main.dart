import 'package:flutter/material.dart';

// Entry point of the app
void main() {
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two-Screen Navigation',
      debugShowCheckedModeBanner: false,
      // The HomeScreen is shown when the app starts
      home: HomeScreen(),
    );
  }
}

// HomeScreen with a title and a button to navigate to the ProfileScreen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'), // Title of the home screen
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('View Profile'),
          onPressed: () {
            // Navigate to the ProfileScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
      ),
    );
  }
}

// ProfileScreen displays a placeholder avatar, name, and email
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'), // Title of the profile screen
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular avatar placeholder (using an icon)
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            SizedBox(height: 16),
            // Display user's name
            Text(
              'Name: Dharshini',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            // Display user's email
            Text(
              'Email: dharshini@example.com',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
