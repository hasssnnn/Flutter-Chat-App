import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  UserCredential? user;

  Future<void> signUpUser(
      {required String email, required String password}) async {
    emit(SignUpLoading());
    try {
       user =
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
      SignUpFailure(errorMessage: e.toString());
    }
    
      }
      
    
  }

