import 'dart:convert';
import 'package:http/http.dart' as http;
import 'UserModel.dart';

Future<List<User>> fetchUsers() async {
  final url = 'https://corsproxy.io/?https://reqres.in/api/users?page=1';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    final List<dynamic> usersJson = jsonBody['data'];
    return usersJson.map((json) => User.fromJson(json)).toList();
  } else {
    print("API ERROR: ${response.statusCode}");
    throw Exception('Failed to load users');
  }
}
