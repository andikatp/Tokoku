import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackbar(ScaffoldMessengerState messenger, String text) {
  messenger.showSnackBar(SnackBar(content: Text(text)));
}


Future<List<File>> pickImages() async {
  List<File> images = [];

  try {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (file != null && file.files.isNotEmpty) {
      for (int i = 0; i < file.files.length; i++) {
        images.add(File(file.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}