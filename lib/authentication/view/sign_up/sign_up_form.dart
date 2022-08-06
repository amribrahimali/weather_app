import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/authentication/bloc/sign_up_cubit.dart';
import 'package:weather_app/authentication/widgets/button_widget.dart';
import 'package:weather_app/authentication/widgets/text_field.dart';
import 'package:weather_app/utils/app_images.dart';
import 'package:weather_app/utils/side_animation.dart';
import 'package:weather_app/utils/snackbar.dart';
import 'package:weather_app/utils/validations.dart';
import 'package:weather_app/weather/view/weather_page.dart';
import 'package:weather_app/weather/widgets/background_img.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignUpCubit>(context);
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImg(),
          SingleChildScrollView(
            child: Form(
              key: signupBloc.formKey,
              child: Column(
                children: [
                  SideInAnimation(1, child: Image.asset(AppImages.appLogoImg)),
                  SideInAnimation(
                    2,
                    child: InputWidget(
                      controller: signupBloc.nameController,
                      hintText: 'name',
                      validator: Validation().nameValidator,
                    ),
                  ),
                  SideInAnimation(
                    3,
                    child: InputWidget(
                      controller: signupBloc.emailController,
                      hintText: 'email address',
                      validator: Validation().emailValidator,
                    ),
                  ),
                  SideInAnimation(
                    4,
                    child: InputWidget(
                      controller: signupBloc.passwordController,
                      hintText: 'password',
                      validator: Validation().passwordValidator,
                    ),
                  ),
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpFailure) {
                        showFailedSnackBar(context, state.error);
                      }
                      if (state is SignUpSuccess) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const WeatherPage()),
                            (Route<dynamic> route) => false);
                      }
                    },
                    builder: (context, state) {
                      return SideInAnimation(
                        5,
                        child: ButtonWidget(
                          isLoading: state is SignUpLoading ? true : false,
                          onPressed: () {
                            if (signupBloc.formKey.currentState!.validate()) {
                              context.read<SignUpCubit>().signUpWithEmail();
                            }
                          },
                          title: 'Sign up',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
