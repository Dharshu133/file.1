import 'dart:convert';
import 'package:http/http.dart' as http;
import 'UserModel.dart';
Future<List<User>> fetchUsers() async {
  final url = 'https://jsonplaceholder.typicode.com/users'; 
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Accept': 'application/json',
      'User-Agent': 'MyFlutterApp/1.0',
    },
  );
  print("STATUS CODE: ${response.statusCode}");
  print("BODY: ${response.body}");
  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    final List<dynamic> usersJson = jsonBody['data'];
    return usersJson.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

