import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/app_colors.dart';

class SearchErrorWidget extends StatelessWidget {
  const SearchErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "ERROR",
      style: GoogleFonts.rubik(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: AppColors.selectedColor),
    ));
  }
}
