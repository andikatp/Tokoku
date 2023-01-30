import 'package:amazon/common/widgets/custom_elevated_button.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constant/color.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum Auth {
  signUp,
  signIn,
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final GlobalKey _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget radioAuth(String title, Auth auth, bool color) {
    return RadioListTile(
      tileColor: color ? GlobalVariable.backgroundColor : null,
      activeColor: GlobalVariable.secondaryColor,
      value: auth,
      groupValue: _auth,
      onChanged: (Auth? auth) => setState(() => _auth = auth!),
      title: Text(title),
    );
  }

  Widget authContainer(bool signUp) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: GlobalVariable.backgroundColor,
      child: Form(
        key: signUp ? _signUpFormKey : _signInFormKey,
        child: Column(
          children: [
            if (signUp)
              CustomTextField(
                controller: _nameController,
                hintText: 'Name',
              ),
            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
            ),
            CustomButton(text: 'Sign Up', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                radioAuth(
                    'Create an Account', Auth.signUp, _auth == Auth.signUp),
                if (_auth == Auth.signUp) authContainer(_auth == Auth.signUp),
                radioAuth('Sign In', Auth.signIn, _auth == Auth.signIn),
                if (_auth == Auth.signIn) authContainer(_auth == Auth.signUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
