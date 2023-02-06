import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/global_variable.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariable.appBarGradient,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Image.asset(
              'assets/images/toko.png',
              width: 120.h,
              height: 45.h,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
                splashRadius: 20.h,
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
                splashRadius: 20.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
