part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

class UserSignupEvent implements SignupEvent{
  final String email;
  final String password;

  UserSignupEvent({required this.email, required this.password});
  
  @override
  List<Object?> get props => [email, password];
  
  @override
  bool? get stringify => true;
}