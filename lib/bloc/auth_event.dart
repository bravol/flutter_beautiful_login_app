part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLogginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLogginRequested({required this.email, required this.password});
}

//event handler for logout
final class AuthLogoutRequested extends AuthEvent {}
