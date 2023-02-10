import 'dart:io';
import 'package:amazon/constant/utils.dart';
import 'package:amazon/models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

class AdminServices {
  void sellProduct({
    required ScaffoldMessengerState msg,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      final CloudinaryPublic cloudinary =
          CloudinaryPublic('djagcyfsw', 'wtdlyuwg');
      List<String> imageUrl = [];
      for (int i = 0; i < imageUrl.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrl.add(response.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          imageUrl: imageUrl,
          category: category,
          price: price,
          quantity: quantity);
    } catch (e) {
      showSnackbar(msg, e.toString());
    }
  }
}
