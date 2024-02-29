import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/src/core/utils/network_exception.dart';
import '../../../../data/repositories/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;

  SignupBloc({required this.authRepository}) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (event is UserSignupEvent) {
        emit(SignupLoading());
        try {
          await authRepository.signUpWithEmail(
              email: event.email, password: event.password);
          await prefs.setBool("isLoggedIn", true);
          emit(SignupSuccess());
        }on NetworkException catch(e) {
          emit(SignupError(message: e.message));
        }  catch (e) {
          emit(SignupError(message: e.toString()));
        }
      }
    });
  }
}
