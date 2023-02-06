import 'package:amazon/constant/global_variable.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariable.appBarGradient,
      ),
      padding: EdgeInsets.all(10.h).copyWith(top: 0.h),
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello ',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
