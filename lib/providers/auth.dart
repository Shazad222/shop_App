import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;
  Future<void> _authenticate(String email, String password,String urlSegment) async{

  }

  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDzhIKlvBciAlV4X83GQyHGLpQP_t2IQQs';
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
// https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]

    print(json.decode(response.body));
  }
  // Future<void> login(String email,String password)async {
  // const url =
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDzhIKlvBciAlV4X83GQyHGLpQP_t2IQQs';

  //   final response = await http.post(Uri.parse(url),
  //       body: json.encode({
  //         "email": email,
  //         "password": password,
  //         "returnSecureToken": true,
  //       }));
  // }
}

        // //         'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDzhIKlvBciAlV4X83GQyHGLpQP_t2IQQs';