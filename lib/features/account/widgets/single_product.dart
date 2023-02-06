import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleProduct extends StatelessWidget {
  final String img;
  const SingleProduct({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15).r,
      padding: const EdgeInsets.all(5).w,
      decoration:
          BoxDecoration(border: Border.all(width: 2.r, color: Colors.grey)),
      child: Image.network(
        img,
        width: 150.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
