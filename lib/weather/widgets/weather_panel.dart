import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPanel extends StatelessWidget {
  const WeatherPanel({Key? key, required this.weatherData}) : super(key: key);
  final Weather weatherData;

  @override
  Widget build(BuildContext context) {
    var display = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(25)),
        height: display.height / 3,
        width: display.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 25, left: 25),
              child: Row(
                children: [
                  Text("Today",
                      style:
                          GoogleFonts.rubik(color: Colors.white, fontSize: 30)),
                  const Spacer(),
                  Text(
                    weatherData.currentConditions?.dayhour ?? '',
                    style: GoogleFonts.rubik(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 25, left: 25),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: weatherData.currentConditions?.temp?.c
                                .toString(),
                            style: GoogleFonts.rubik(
                                fontSize: 70, color: Colors.white)),
                        TextSpan(
                            text: "°C",
                            style: GoogleFonts.rubik(
                                fontSize: 70, color: AppColors.selectedColor))
                      ],
                    ),
                  ),
                  const Spacer(),
                  CachedNetworkImage(
                    imageUrl: weatherData.currentConditions?.iconURL ?? '',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, right: 25, left: 25, bottom: 20),
              child: Row(
                children: [
                  const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                      color: AppColors.selectedColor),
                  Expanded(
                    child: Text(
                      weatherData.region ?? '',
                      overflow: TextOverflow.ellipsis,
                      style:
                          GoogleFonts.rubik(fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
