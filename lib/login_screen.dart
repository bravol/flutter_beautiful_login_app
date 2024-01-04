import 'package:flutter/material.dart';
import 'package:flutter_beautiful_login_app/widgets/login_field.dart';
import 'package:flutter_beautiful_login_app/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/signin_balls.png'),
            const Text(
              'Sign in',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const SocialButton(
              iconPath: 'assets/images/g_logo.svg',
              label: 'Continue with Google',
            ),
            const SizedBox(height: 20),
            const SocialButton(
              iconPath: 'assets/images/f_logo.svg',
              label: 'Continue with Facebook',
              horizontalPadding: 90,
            ),
            const SizedBox(height: 15),
            const Text(
              'or',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 15),
            const LoginField(hintiText: 'Email'),
            const SizedBox(height: 15),
            const LoginField(hintiText: 'Password'),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
