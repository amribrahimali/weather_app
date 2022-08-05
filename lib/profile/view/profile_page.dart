import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/profile/bloc/update_user_data_cubit.dart';
import 'package:weather_app/profile/view/profile_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return BlocProvider<UpdateUserDataCubit>(
      create: (context) => UpdateUserDataCubit(user: auth.currentUser)
        ..getCurrentUserData(auth.currentUser!),
      child: ProfileForm(user: auth.currentUser),
    );
  }
}
