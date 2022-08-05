import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/weather/bloc/get_weather_by_city/get_weather_by_city_cubit.dart';
import 'package:weather_app/weather/bloc/switch_search/switch_search_cubit.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityBloc = BlocProvider.of<GetWeatherByCityCubit>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        onSubmitted: (value) =>
            context.read<SwitchSearchCubit>().switchSearch(false),
        controller: cityBloc.cityController,
        style: GoogleFonts.rubik(fontSize: 15, color: Colors.white),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.rubik(fontSize: 15, color: Colors.white),
          hintText: 'Search your city',
          prefixIcon: IconButton(
              onPressed: () {
                context
                    .read<GetWeatherByCityCubit>()
                    .getWeather(city: cityBloc.cityController.text);
                context.read<SwitchSearchCubit>().switchSearch(false);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
