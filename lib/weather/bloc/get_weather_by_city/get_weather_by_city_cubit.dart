import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

part 'get_weather_by_city_state.dart';

class GetWeatherByCityCubit extends Cubit<GetWeatherByCityState> {
  GetWeatherByCityCubit({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(GetWeatherByCityInitial());

  final WeatherRepository _weatherRepository;
  TextEditingController cityController = TextEditingController();

  void getWeather({String? city, String? location}) async {
    emit(GetWeatherByCityLoading());
    try {
      final response =
          await _weatherRepository.getWeather(city: city, location: location);
      emit(GetWeatherByCitySuccess(weather: response));
    } on SocketException catch (_) {
      emit(const GetWeatherByCityFailure(error: 'Network error'));
    } catch (error) {
      emit(GetWeatherByCityFailure(error: error.toString()));
    }
  }
}
