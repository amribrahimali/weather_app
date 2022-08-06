import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/authentication/view/login/login_page.dart';
import 'package:weather_app/profile/bloc/update_user_data_cubit.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/side_animation.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideInAnimation(
      1,
      child: GestureDetector(
        onTap: () async {
          context.read<UpdateUserDataCubit>().logOut();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.accentColor),
                borderRadius: BorderRadius.circular(8)),
            child: const Text('Logout',
                style: TextStyle(fontSize: 25, color: AppColors.primaryColor)),
          ),
        ),
      ),
    );
  }
}
