part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class UserLoginEvent implements LoginEvent{
  final String email;
  final String password;

  UserLoginEvent({required this.email, required this.password});
}
