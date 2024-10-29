// ignore_for_file: non_constant_identifier_names

import "dart:convert";
import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;

class User {
  String id;
  String email;
  String name;

  User({
    required this.id,
    this.email = "",
    this.name = "",
  });
  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object["id"].toString(),
        email: object["email"],
        name: object["first_name"] + object["last_name"]);
  }

  static Future<User> connectToApi(String id) async {
    String apiUrl = "https://reqres.in/api/users/" + id;
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)["data"];

    return User.createUser(userData);
  }
}
