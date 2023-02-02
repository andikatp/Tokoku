import 'dart:convert';
import 'package:amazon/constant/color.dart';
import 'package:amazon/constant/error_handling.dart';
import 'package:amazon/constant/utils.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/models/user.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // ignore: use_build_context_synchronously
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

  //sign in user
  Future<void> signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          });
      // ignore: use_build_context_synchronously
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () async {
            final prefs = await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['token']);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, HomeScreen.routeName);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  //get user data
  Future<void> getUserData(
    BuildContext context,
  ) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auht-token');

      if (token == null) {
        prefs.setString('x-auth=token', '');
      }
      var tokenResponse = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenResponse.body);

      if (response == true) {
        //get user Data
        http.Response userResponse = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false)
            .setUser(userResponse.body);
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
