import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/constant/global_variable.dart';
import 'package:amazon/features/auth/screens/auth_screen.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  AuthService authService = AuthService();

  @override
  void initState() {
    authService.getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: Provider.of<UserProvider>(context).user.token.isEmpty
          ? BottomBar.routeName
          : AuthScreen.routeName,
      routes: {
        AuthScreen.routeName: (context) => const AuthScreen(),
        BottomBar.routeName: (context) => const BottomBar(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
