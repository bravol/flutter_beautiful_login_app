import 'package:flutter/material.dart';
import 'package:flutter_beautiful_login_app/bloc/auth_bloc.dart';
import 'package:flutter_beautiful_login_app/home_screen.dart';
import 'package:flutter_beautiful_login_app/widgets/gradient_button.dart';
import 'package:flutter_beautiful_login_app/widgets/login_field.dart';
import 'package:flutter_beautiful_login_app/widgets/social_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        // TODO: implement listener
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }

        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset('assets/images/signin_balls.png'),
                ),
                const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                SocialButton(
                  iconPath: 'assets/images/g_logo.svg',
                  label: 'Continue with Google',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                SocialButton(
                  iconPath: 'assets/images/f_logo.svg',
                  label: 'Continue with Facebook',
                  horizontalPadding: 80,
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                const Text(
                  'or',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintiText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintiText: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogginRequested(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    },
                    text: 'Sign in'),
                const SizedBox(height: 30),
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an Account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Create account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Forgot Password',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 40),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
