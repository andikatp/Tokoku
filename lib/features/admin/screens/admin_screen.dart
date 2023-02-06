import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar_widget.dart';

class AdminScreen extends StatelessWidget {
  static const routeName = '/admin-screen';
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              print(Provider.of<UserProvider>(context, listen: false)
                  .user
                  .type
                  .toString());
            },
            child: const Text('s')),
      ),
    );
  }
}
