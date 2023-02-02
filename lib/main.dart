import 'package:amazon/constant/color.dart';
import 'package:amazon/features/auth/screens/auth_screen.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: GlobalVariable.secondaryColor),
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: AuthScreen.routeName,
        routes: {
          AuthScreen.routeName: (context) => const AuthScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
