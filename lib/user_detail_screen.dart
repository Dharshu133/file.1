import 'package:flutter/material.dart';
class UserDetailScreen extends StatelessWidget {
  final Map user;
  const UserDetailScreen({super.key, required this.user});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Detail")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            Text(
              user['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(user['email'], style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("ID: ${user['id']}", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

