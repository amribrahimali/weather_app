import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit({User? user}) : super(UpdateUserDataInitial());

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  User? user;

  void updateUserData() async {
    emit(UpdateUserDataLoading());
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User user = auth.currentUser!;
      user.updateEmail(emailController?.text ?? user.email ?? '');
      user.updatePassword(passwordController?.text ?? '');
      user.updateDisplayName(nameController?.text ?? user.displayName);
      emit(UpdateUserDataSuccess(user: user));
    } on FirebaseAuthException catch (e) {
      emit(UpdateUserDataFailure(error: e.code));
    } catch (e) {
      emit(UpdateUserDataFailure(error: e.toString()));
    }
  }

  void getCurrentUserData(User user) {
    emit(FetchCurrentUserDataSuccess(
        name: nameController = TextEditingController(text: user.displayName),
        email: emailController = TextEditingController(text: user.email)));
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> close() {
    passwordController?.dispose();
    emailController?.dispose();
    nameController?.dispose();
    return super.close();
  }
}
