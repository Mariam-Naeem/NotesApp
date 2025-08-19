import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/signup_validator.dart';
part 'signup_event.dart';
part 'signup_state.dart';
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupSubmittedEvent>(_onSignupSubmitted);
    on<SignupReset>(_onSignupReset);
  }

  Future<void> _onSignupSubmitted(
    SignupSubmittedEvent event,
    Emitter<SignupState> emit,
  ) async {
    final errors = SignupValidator.validateSignupFields(
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
    );

    if (errors.isNotEmpty) {
      emit(SignupFailure(errors.values.first));
      return;
    }

    emit(SignupLoading());

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(SignupSuccess(event.email));
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(e.message ?? 'حدث خطأ أثناء التسجيل'));
    } catch (e) {
      emit(SignupFailure('خطأ غير متوقع: ${e.toString()}'));
    }
  }

  void _onSignupReset(SignupReset event, Emitter<SignupState> emit) {
    emit(SignupInitial());
  }
}
