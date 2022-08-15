part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent extends Equatable {}

class UserResetPasswordEvent implements ResetPasswordEvent{
  final String code;
  final String newPassword;

  UserResetPasswordEvent({required this.code, required this.newPassword});
  
  @override
  List<Object?> get props => [code, newPassword];
  
  @override
  bool? get stringify => true;
}
