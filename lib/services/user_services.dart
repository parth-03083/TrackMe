import 'dart:convert';
import 'package:ace_hack/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<User>> getAll() async {
    const url = "http://192.168.43.76:8000/students";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body) as List;
      // final user = json[0].map((e) {
      //   return User(
      //     id: e['id'],
      //     college: e['college'],
      //     firstName: e['first_name'],
      //     secondName: e['second_name'],
      //     email: e['email'],
      //     password: e['password'],
      //     profilePic: e['profilePic'],
      //     adhaarNo: e['adhaar_No'],
      //     mobileNo: e['mobile_n o'],
      //   );
      // });
      final user = studentToJson(studentFromJson(response.body));
      print(user[0]);
    }
    // return [];
    throw "Something Went wrong";
  }
}
