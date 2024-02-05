import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogginRequested>((event, emit) async {
      emit(AuthLoading());
      //simulate login
      try {
        final email = event.email;
        final password = event.password;

        //password validation
        if (password.length < 6) {
          emit(AuthFailure(error: "Password must be at least 6 characters"));
          return;
        } else if (password.isEmpty) {
          emit(AuthFailure(error: "Password cannot be empty"));
          return;
        }
        //email validation
        if (email.isEmpty || !email.contains('@')) {
          emit(AuthFailure(error: "Invalid email"));
          return;
        }

        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccess(email: email));
        });
      } catch (e) {
        return emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
