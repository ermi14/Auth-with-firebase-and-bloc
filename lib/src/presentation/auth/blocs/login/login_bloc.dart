import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/src/data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if(event is UserLoginEvent) {
        emit(LoginLoading());
        final result = await authRepository.signInWithEmail(email: event.email, password: event.password);
      }
    });
  }
}
