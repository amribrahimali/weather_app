import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/authentication/bloc/sign_up_cubit.dart';
import 'package:weather_app/authentication/view/sign_up/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: const SignUpForm(),
    );
  }
}
