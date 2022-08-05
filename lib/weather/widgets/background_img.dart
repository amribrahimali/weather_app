import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_images.dart';

class BackgroundImg extends StatelessWidget {
  const BackgroundImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.backgroundImg,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
