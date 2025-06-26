import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String error = '';
  Future<void> login() async {
    setState(() {
      isLoading = true;
      error = '';
    });
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        error = "Email and password can't be empty";
        isLoading = false;
      });
      return;
    }
    if (email == "kdharshini@gmail.com" && password == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder:(_) => UserListScreen()),
      );
    } else {
      setState(() {
        error = "Invalid email or password";
        isLoading = false;
      });
    }
  }
  void goToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SignupScreen()),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
            SizedBox(height: 16),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: login, child: Text("Login")),
            TextButton(onPressed: goToSignup, child: Text("Don't have an account? Sign up")),
          ],
        ),
      ),
    );
  }
}
class SignupScreen extends StatefulWidget {
  _SignupScreenState createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String message = '';
  void signup() {
    setState(() {
      isLoading = true;
      message = '';
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        message = "Signup successful";
        isLoading = false;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            if (message.isNotEmpty)
              Text(message, style: TextStyle(color: Colors.green)),
            SizedBox(height: 16),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: signup, child: Text("Sign up")),
          ],
        ),
      ),
    );
  }
}
class UserListScreen extends StatefulWidget {
  _UserListScreenState createState() => _UserListScreenState();
}
class _UserListScreenState extends State<UserListScreen> {
  List users = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  bool isError = false;
  ScrollController _scrollController = ScrollController();
  void initState() {
    super.initState();
    fetchUsers();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100 && !isLoading && hasMore) {
        fetchUsers();
      }
    });
  }
  Future<void> fetchUsers({bool refresh = false}) async {
    setState(() {
      isLoading = true;
      isError = false;
    });
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List newUsers = data;
        setState(() {
          if (refresh) {
            users = newUsers;
            page = 2;
          } else {
            users.addAll(newUsers);
            page++;
          }
          hasMore = false;
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      setState(() {
        isError = true;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  Future<void> refreshList() async {
    page = 1;
    await fetchUsers(refresh: true);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: isError
            ? Center(child: Text("Failed to load users"))
            : ListView.builder(
                controller: _scrollController,
                itemCount: users.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < users.length) {
                    final user = users[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserDetailScreen(user: user),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(user['name'][0]),
                        ),
                        title: Text(user['name'] ?? 'No Name'),
                        subtitle: Text(user['email'] ?? 'No Email'),
                      ),
                    );
                  } else {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
class UserDetailScreen extends StatelessWidget {
  final Map user;
  UserDetailScreen({required this.user});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              child: Text(user['name'][0], style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 20),
            Text(user['name'], style: TextStyle(fontSize: 24)),
            Text(user['email'], style: TextStyle(fontSize: 16)),
            Text('ID: ${user['id']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

