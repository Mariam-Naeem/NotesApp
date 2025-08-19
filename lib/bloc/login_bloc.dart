import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:notes/validator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmittedEvent>(_onLoginSubmitted);
    on<LoginReset>(_onLoginReset);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    final errors = LoginValidator.validateLoginFields(
      email: event.email,
      password: event.password,
    );

    if (errors.isNotEmpty) {
      emit(LoginFailure(errors.values.first));
      return;
    }

    emit(LoginLoading());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(LoginSuccess(event.email));
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message ?? 'حدث خطأ أثناء تسجيل الدخول'));
    } catch (e) {
      emit(LoginFailure('خطأ غير متوقع: ${e.toString()}'));
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }
}
