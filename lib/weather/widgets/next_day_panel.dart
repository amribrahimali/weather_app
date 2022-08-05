import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_repository/weather_repository.dart';

class NextDaysPanel extends StatelessWidget {
  const NextDaysPanel({Key? key, required this.weatherData}) : super(key: key);
  final Weather weatherData;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height / 5,
      width: double.infinity,
      child: ListView.builder(
        itemCount: weatherData.nextDays?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: screenSize.width / 3,
              decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: CachedNetworkImage(
                          imageUrl: weatherData.nextDays![index].iconURL ?? '',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator.adaptive(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        weatherData.nextDays![index].day ?? '',
                        style: GoogleFonts.rubik(
                            fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: weatherData.nextDays![index].maxTemp?.c
                                    .toString(),
                                style: GoogleFonts.rubik(
                                    fontSize: 30, color: Colors.white)),
                            TextSpan(
                                text: "°C",
                                style: GoogleFonts.rubik(
                                    fontSize: 15,
                                    color: AppColors.selectedColor))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
