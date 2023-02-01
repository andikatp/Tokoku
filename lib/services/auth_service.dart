import 'package:amazon/constant/color.dart';
import 'package:amazon/constant/error_handling.dart';
import 'package:amazon/constant/utils.dart';
import 'package:amazon/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //sign up user
  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          });
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            showSnackbar(context, 'Account has been created');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
