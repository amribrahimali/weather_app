import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({this.region, this.currentConditions, this.nextDays});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final String? region;
  final CurrentConditions? currentConditions;
  @JsonKey(name: 'next_days')
  final List<NextDay>? nextDays;

  @override
  List<Object?> get props => [region, currentConditions, nextDays];
}
