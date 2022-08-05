import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/profile/view/profile_page.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/weather/bloc/get_current_location/get_current_location_cubit.dart';
import 'package:weather_app/weather/bloc/get_weather_by_city/get_weather_by_city_cubit.dart';
import 'package:weather_app/weather/bloc/switch_search/switch_search_cubit.dart';
import 'package:weather_app/weather/widgets/background_img.dart';
import 'package:weather_app/weather/widgets/error_widget.dart';
import 'package:weather_app/weather/widgets/next_day_panel.dart';
import 'package:weather_app/weather/widgets/others_details.dart';
import 'package:weather_app/weather/widgets/search_panel.dart';
import 'package:weather_app/weather/widgets/weather_panel.dart';

class WeatherForm extends StatelessWidget {
  const WeatherForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchState = context.watch<SwitchSearchCubit>().state;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: searchState.isSearch == true
            ? const SearchPanel()
            : Text("Weather Forecast",
                style: GoogleFonts.rubik(fontSize: 20, color: Colors.white)),
        leading: Visibility(
          visible: searchState.isSearch == true ? false : true,
          child: IconButton(
              onPressed: () =>
                  context.read<SwitchSearchCubit>().switchSearch(true),
              icon: const Icon(Icons.search)),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              icon: const Icon(Icons.person_rounded, size: 30))
        ],
      ),
      body: BlocBuilder<GetWeatherByCityCubit, GetWeatherByCityState>(
          builder: (context, state) {
        if (state is GetWeatherByCityLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is GetWeatherByCitySuccess) {
          return Stack(
            children: [
              const BackgroundImg(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeatherPanel(weatherData: state.weather),
                    OtherDetailPage(weatherData: state.weather),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text("Next 7 Days",
                          style: GoogleFonts.rubik(
                              fontSize: 18, color: AppColors.primaryColor)),
                    ),
                    NextDaysPanel(weatherData: state.weather)
                  ],
                ),
              )
            ],
          );
        }
        if (state is GetWeatherByCityFailure) {
          return const SearchErrorWidget();
        }
        return const SizedBox();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<GetCurrentLocationCubit>().getCurrentLocation(),
        backgroundColor: AppColors.selectedColor,
        child: Icon(Icons.near_me, color: AppColors.accentColor),
      ),
    );
  }
}
