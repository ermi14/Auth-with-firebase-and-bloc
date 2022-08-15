import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/src/data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (event is UserLoginEvent) {
        emit(LoginLoading());
        try {
          await authRepository.signInWithEmail(
              email: event.email, password: event.password);
          await prefs.setBool("isLoggedIn", true);
          emit(LoginSuccess());
        } catch (e) {
          emit(LoginError(message: e.toString()));
        }
      }
    });
  }
}
