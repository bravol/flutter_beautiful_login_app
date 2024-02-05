import 'package:flutter/material.dart';
import 'package:flutter_beautiful_login_app/bloc/auth_bloc.dart';
import 'package:flutter_beautiful_login_app/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //keeps on listening to the changes/ u can use it instead of BlocBuilder, all work the same way
    //but for the context.watch rebuilds extra components in case there is a change in which is not the case in BlocBuilder
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // final authState = context.watch<AuthBloc>().state as AuthSuccess;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is AuthSuccess) Center(child: Text(state.email)),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                },
                child: const Text('Sign out'),
              )
            ],
          );
        },
      ),
    );
  }

  // //USING BLOC BUILDER
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Home Screen'),
  //     ),
  //     body: BlocBuilder<AuthBloc, AuthState>(
  //       builder: (context, state) {
  //       return  Center(child: Text( (state as AuthSuccess).email));
  //       },
  //     ),
  //   );
  // }
}
