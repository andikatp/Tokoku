import 'dart:convert';
import 'package:amazon/constant/global_variable.dart';
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
    required ScaffoldMessengerState messenger,
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
          messenger: messenger,
          onSuccess: () {
            showSnackbar(messenger, 'Account has been created');
          });
    } catch (e) {
      showSnackbar(messenger, e.toString());
    }
  }

  //sign in user
  Future<void> signInUser(
      {required BuildContext context,
      required ScaffoldMessengerState messenger,
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
      httpErrorHandler(
          response: response,
          messenger: messenger,
          onSuccess: () async {
            final prov = Provider.of<UserProvider>(context, listen: false);
            final pushNamed =
                Navigator.pushNamed(context, HomeScreen.routeName);
            final prefs = await SharedPreferences.getInstance();

            prov.setUser(response.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['token']);
            pushNamed;
          });
    } catch (e) {
      showSnackbar(messenger, e.toString());
    }
  }

  //get user data
  Future<void> getUserData(
    BuildContext context,
  ) async {
    try {
      var prov = Provider.of<UserProvider>(context, listen: false);
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

        var prof = prov.setUser(userResponse.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
