import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/utils/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String? title;
  final double? verticalMargin, horizontalMargin;
  final bool noAction;
  final bool isLoading;

  const ButtonWidget(
      {Key? key,
      required this.onPressed,
      this.title,
      this.noAction = true,
      this.isLoading = false,
      this.verticalMargin,
      this.horizontalMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => noAction == true && isLoading == false ? onPressed() : {},
      child: Container(
        decoration: BoxDecoration(
            color: noAction == true
                ? AppColors.accentColor
                : Theme.of(context).primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin ?? 18,
            vertical: verticalMargin ?? 4.0.h),
        height: 5.9.h,
        child: Center(
            child: isLoading == true
                ? Transform.scale(
                    scale: 0.1.h,
                    child:
                        const CircularProgressIndicator(color: AppColors.white))
                : Text(title ?? '',
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: AppColors.white, fontSize: 20))),
      ),
    );
  }
}
