import 'package:flutter/material.dart';
import 'package:weather_app/utils/skeleton.dart';

class WeatherShimmer extends StatelessWidget {
  const WeatherShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Skeleton(
                height: screenSize.height / 3,
                width: screenSize.width,
                radius: 20),
            const SizedBox(height: 30),
            Skeleton(
                height: screenSize.height / 10,
                width: screenSize.width,
                radius: 20),
            const SizedBox(height: 50),
            Skeleton(width: screenSize.width / 4),
            const SizedBox(height: 15),
            SizedBox(
              width: screenSize.width,
              height: screenSize.height / 4,
              child: ListView.separated(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) =>
                      Skeleton(width: screenSize.width / 3, radius: 20),
                  separatorBuilder: (ctx, i) => const SizedBox(width: 20)),
            )
          ],
        ),
      ),
    );
  }
}
