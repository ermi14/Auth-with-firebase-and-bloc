part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent extends Equatable {}

class UserForgotPasswordEvent implements ForgotPasswordEvent{
  final String email;

  UserForgotPasswordEvent({required this.email});
  
  @override
  List<Object?> get props => [email];
  
  @override
  bool? get stringify => true;
}
