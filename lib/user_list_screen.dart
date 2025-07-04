import 'package:flutter/material.dart';
import 'UserModel.dart';
import 'api_service.dart';
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  State<UserListScreen> createState() => _UserListScreenState();
}
class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];
  bool isLoading = true;
  void initState() {
    super.initState();
    loadUsers();
  }
  void loadUsers() async {
    try {
      final fetchedUsers = await fetchUsers();
      setState(() {
        users = fetchedUsers;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
    }
  }  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),                 
                );
              },
            ),
    );
  }
}
