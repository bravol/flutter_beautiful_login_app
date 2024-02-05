import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    //login
    on<AuthLogginRequested>(_onAuthLogInRequested);
    //logout
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

//a methid to log in
  void _onAuthLogInRequested(
      AuthLogginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    //simulate login
    try {
      final email = event.email;
      final password = event.password;

      //password validation
      if (password.length < 6) {
        emit(AuthFailure("Password must be at least 6 characters"));
        return;
      } else if (password.isEmpty) {
        emit(AuthFailure("Password cannot be empty"));
        return;
      }
      //email validation
      if (email.isEmpty || !email.contains('@')) {
        emit(AuthFailure("Invalid email"));
        return;
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(email: email));
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

// a methid to log out
  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
