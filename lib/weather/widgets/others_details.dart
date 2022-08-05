import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/fade_animation.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_repository/weather_repository.dart';

class OtherDetailPage extends StatelessWidget {
  const OtherDetailPage({Key? key, required this.weatherData})
      : super(key: key);
  final Weather weatherData;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return FadeInAnimation(
      3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: screenSize.height / 10,
          width: screenSize.width,
          decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(
                      WeatherIcons.strong_wind,
                      color: AppColors.selectedColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${weatherData.currentConditions?.wind?.km} Km/h",
                      style:
                          GoogleFonts.rubik(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      WeatherIcons.humidity,
                      color: AppColors.selectedColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      weatherData.currentConditions?.humidity ?? '',
                      style:
                          GoogleFonts.rubik(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      WeatherIcons.rain,
                      color: AppColors.selectedColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      weatherData.currentConditions?.precip ?? '',
                      style:
                          GoogleFonts.rubik(fontSize: 15, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
