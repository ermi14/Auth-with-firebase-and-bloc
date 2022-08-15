part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class UserLoginEvent implements LoginEvent{
  final String email;
  final String password;

  UserLoginEvent({required this.email, required this.password});
  
  @override
  List<Object?> get props => [email, password];
  
  @override
  bool? get stringify => true;
}
