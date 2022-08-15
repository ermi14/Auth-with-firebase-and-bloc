import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/src/data/repositories/auth_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository authRepository;

  ResetPasswordBloc({required this.authRepository})
      : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async {
      if (event is UserResetPasswordEvent) {
        emit(ResetPasswordLoading());
        try {
          await authRepository.resetPassword(
              code: event.code, newPassword: event.newPassword);
          emit(ResetPasswordSuccess());
        } catch (e) {
          emit(ResetPasswordError(message: e.toString()));
        }
      }
    });
  }
}
