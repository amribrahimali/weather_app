import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/authentication/bloc/login_cubit.dart';
import 'package:weather_app/authentication/widgets/button_widget.dart';
import 'package:weather_app/authentication/widgets/text_field.dart';
import 'package:weather_app/utils/app_images.dart';
import 'package:weather_app/utils/side_animation.dart';
import 'package:weather_app/utils/snackbar.dart';
import 'package:weather_app/utils/validations.dart';
import 'package:weather_app/weather/view/weather_page.dart';
import 'package:weather_app/weather/widgets/background_img.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImg(),
          SingleChildScrollView(
            child: Form(
              key: loginBloc.formKey,
              child: Column(
                children: [
                  SideInAnimation(1, child: Image.asset(AppImages.appLogoImg)),
                  SideInAnimation(
                    2,
                    child: InputWidget(
                      controller: loginBloc.emailController,
                      hintText: 'email address',
                      validator: Validation().emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SideInAnimation(
                    3,
                    child: InputWidget(
                      controller: loginBloc.passwordController,
                      hintText: 'password',
                      validator: Validation().passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        showFailedSnackBar(context, state.error);
                      }
                      if (state is LoginSuccess) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const WeatherPage()),
                            (Route<dynamic> route) => false);
                      }
                    },
                    builder: (context, state) {
                      return SideInAnimation(
                        4,
                        child: ButtonWidget(
                          isLoading: state is LoginLoading ? true : false,
                          onPressed: () {
                            if (loginBloc.formKey.currentState!.validate()) {
                              context.read<LoginCubit>().loginWithEmail();
                            }
                          },
                          title: 'Login',
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
