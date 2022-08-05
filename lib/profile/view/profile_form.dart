import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/authentication/view/login/login_page.dart';
import 'package:weather_app/authentication/widgets/button_widget.dart';
import 'package:weather_app/authentication/widgets/text_field.dart';
import 'package:weather_app/profile/bloc/update_user_data_cubit.dart';
import 'package:weather_app/profile/widgets/logout_section.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/app_images.dart';
import 'package:weather_app/utils/snackbar.dart';
import 'package:weather_app/utils/validations.dart';
import 'package:weather_app/weather/widgets/background_img.dart';

class ProfileForm extends StatelessWidget {
  final User? user;
  const ProfileForm({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateDataBloc = BlocProvider.of<UpdateUserDataCubit>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text("Profile",
              style: GoogleFonts.rubik(fontSize: 20, color: Colors.white)),
          leading: BackButton(onPressed: () => Navigator.pop(context))),
      body: Stack(
        children: [
          const BackgroundImg(),
          SingleChildScrollView(
            child: Form(
              key: updateDataBloc.formKey,
              child: Column(
                children: [
                  const LogoutSection(),
                  InputWidget(
                    controller: updateDataBloc.nameController,
                    hintText: 'name',
                    validator: Validation().nameValidator,
                  ),
                  InputWidget(
                    controller: updateDataBloc.emailController,
                    hintText: 'email address',
                    validator: Validation().emailValidator,
                  ),
                  InputWidget(
                    controller: updateDataBloc.passwordController,
                    hintText: 'password',
                  ),
                  BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
                    listener: (context, state) {
                      if (state is UpdateUserDataFailure) {
                        showFailedSnackBar(context, state.error);
                      }
                      if (state is UpdateUserDataSuccess) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return ButtonWidget(
                        isLoading:
                            state is UpdateUserDataLoading ? true : false,
                        onPressed: () {
                          if (updateDataBloc.formKey.currentState!.validate()) {
                            context
                                .read<UpdateUserDataCubit>()
                                .updateUserData();
                          }
                        },
                        title: 'Update',
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
