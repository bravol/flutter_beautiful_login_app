import 'package:flutter/material.dart';
import 'package:flutter_beautiful_login_app/app_bloc_observer.dart';
import 'package:flutter_beautiful_login_app/bloc/auth_bloc.dart';
import 'package:flutter_beautiful_login_app/login_screen.dart';
import 'package:flutter_beautiful_login_app/pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver(); //know what is going on
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
