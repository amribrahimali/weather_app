import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/bloc/get_current_location/get_current_location_cubit.dart';
import 'package:weather_app/weather/bloc/get_weather_by_city/get_weather_by_city_cubit.dart';
import 'package:weather_app/weather/bloc/switch_search/switch_search_cubit.dart';
import 'package:weather_app/weather/view/weather_form.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetWeatherByCityCubit>(
            create: (context) => GetWeatherByCityCubit(
                weatherRepository:
                    RepositoryProvider.of<WeatherRepository>(context))
              ..getWeather(city: 'cairo')),
        BlocProvider<GetCurrentLocationCubit>(
            create: (context) => GetCurrentLocationCubit()),
        BlocProvider<SwitchSearchCubit>(
            create: (context) => SwitchSearchCubit()),
      ],
      child: BlocListener<GetCurrentLocationCubit, GetCurrentLocationState>(
        listener: (context, state) {
          if (state is GetCurrentLocationSuccess) {
            context
                .read<GetWeatherByCityCubit>()
                .getWeather(location: '${state.latitude},${state.longitude}');
          }
        },
        child: const WeatherForm(),
      ),
    );
  }
}
