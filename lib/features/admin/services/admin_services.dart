import 'dart:io';
import 'package:amazon/constant/error_handling.dart';
import 'package:amazon/constant/global_variable.dart';
import 'package:amazon/constant/utils.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext ctx,
    required ScaffoldMessengerState msg,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    final provider = Provider.of<UserProvider>(ctx, listen: false);
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

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-prodcut'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': provider.user.token,
        },
        body: product.toJson(),
      );
      httpErrorHandler(
          response: res,
          messenger: msg,
          onSuccess: () {
            showSnackbar(msg, 'Product Added Successfully!');
            Navigator.pop(ctx);
          });
    } catch (e) {
      showSnackbar(msg, e.toString());
    }
  }
}
