import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void loginWithEmail() async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emit(LoginSuccess(user: credential.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const LoginFailure(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(const LoginFailure(
            error: 'Wrong password provided for that user.'));
      }
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    emailController.dispose();
    return super.close();
  }
}
