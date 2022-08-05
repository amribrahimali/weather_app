part of 'get_weather_by_city_cubit.dart';

abstract class GetWeatherByCityState extends Equatable {
  const GetWeatherByCityState();
}

class GetWeatherByCityInitial extends GetWeatherByCityState {
  @override
  List<Object> get props => [];
}

class GetWeatherByCityLoading extends GetWeatherByCityState {
  @override
  List<Object> get props => [];
}

class GetWeatherByCitySuccess extends GetWeatherByCityState {
  final Weather weather;
  const GetWeatherByCitySuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}

class GetWeatherByCityFailure extends GetWeatherByCityState {
  final String? error;
  const GetWeatherByCityFailure({this.error});

  @override
  List<Object?> get props => [error];
}
