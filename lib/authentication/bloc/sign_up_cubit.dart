import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signUpWithEmail() async {
    emit(SignUpLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = credential.user;
      user?.updateDisplayName(nameController.text);
      emit(SignUpSuccess(user: user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const SignUpFailure(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(const SignUpFailure(
            error: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpFailure(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
    return super.close();
  }
}
