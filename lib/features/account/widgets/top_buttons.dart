import 'package:amazon/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20).r,
      child: Column(
        children: [
          Row(
            children: [
              AccountButton(text: 'Your Orders', function: () {}),
              AccountButton(text: 'Turn Seller', function: () {}),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              AccountButton(text: 'Log Out', function: () {}),
              AccountButton(text: 'Your Wish List', function: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
