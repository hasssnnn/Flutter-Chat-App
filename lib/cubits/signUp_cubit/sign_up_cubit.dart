import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({required String email, required String password})async {
    try {
      emit(SignUpLoading());
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(errorMessage: 'Password is weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      SignUpFailure(errorMessage: 'There was an error, try again');
    }
  }
}
