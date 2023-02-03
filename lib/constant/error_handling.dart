import 'dart:convert';
import 'package:amazon/constant/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandler({
  required http.Response response,
  required ScaffoldMessengerState messenger,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(messenger, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackbar(messenger, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackbar(messenger, response.body);
  }
}
