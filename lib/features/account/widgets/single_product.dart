import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String img;
  const SingleProduct({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.grey)),
      child: Image.network(
        img,
        height: 50,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
