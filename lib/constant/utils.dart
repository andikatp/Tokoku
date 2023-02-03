import 'package:flutter/material.dart';

void showSnackbar(ScaffoldMessengerState messenger, String text) {
  messenger.showSnackBar(SnackBar(content: Text(text)));
}
