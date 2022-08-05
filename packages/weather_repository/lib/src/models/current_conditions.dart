import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/src/models/models.dart';

part 'current_conditions.g.dart';

@JsonSerializable()
class CurrentConditions extends Equatable {
  const CurrentConditions(
      {this.dayhour,
      this.temp,
      this.precip,
      this.humidity,
      this.wind,
      this.iconURL,
      this.comment});

  factory CurrentConditions.fromJson(Map<String, dynamic> json) =>
      _$CurrentConditionsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentConditionsToJson(this);

  final String? dayhour;
  final Temp? temp;
  final String? precip;
  final String? humidity;
  final Wind? wind;
  final String? iconURL;
  final String? comment;

  @override
  List<Object?> get props =>
      [dayhour, temp, precip, humidity, wind, iconURL, comment];
}
