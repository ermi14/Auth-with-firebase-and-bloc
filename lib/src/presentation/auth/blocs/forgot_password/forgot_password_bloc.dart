import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/src/core/utils/network_exception.dart';
import 'package:test_task/src/data/repositories/auth_repository.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordBloc({required this.authRepository})
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) async {
      if (event is UserForgotPasswordEvent) {
        emit(ForgotPasswordLoading());
        try {
          await authRepository.forgotPassword(email: event.email);
          emit(ForgotPasswordSuccess());
        } on NetworkException catch (e) {
          emit(ForgotPasswordError(message: e.message));
        } catch (e) {
          emit(ForgotPasswordError(message: e.toString()));
        }
      }
    });
  }
}
