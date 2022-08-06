import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/app_colors.dart';

class SearchErrorWidget extends StatelessWidget {
  const SearchErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.refresh, color: AppColors.primaryColor, size: 40),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              "Not Found Weather Data for this Location.\n please, try again.",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.selectedColor),
            ),
          ),
        ],
      ),
    );
  }
}
