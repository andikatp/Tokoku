import 'package:amazon/constant/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariable.secondaryColor),
        scaffoldBackgroundColor: GlobalVariable.backgroundColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Amazon Clone'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('Test'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('as'))
          ],
        ),
      ),
    );
  }
}
