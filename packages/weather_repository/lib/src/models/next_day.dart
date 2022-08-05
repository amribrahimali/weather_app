import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/src/models/models.dart';

part 'next_day.g.dart';

@JsonSerializable()
class NextDay extends Equatable {
  const NextDay(
      {this.day, this.comment, this.maxTemp, this.minTemp, this.iconURL});

  factory NextDay.fromJson(Map<String, dynamic> json) =>
      _$NextDayFromJson(json);

  Map<String, dynamic> toJson() => _$NextDayToJson(this);

  final String? day;
  final String? comment;
  @JsonKey(name: 'max_temp')
  final Temp? maxTemp;
  @JsonKey(name: 'min_temp')
  final Temp? minTemp;
  final String? iconURL;

  @override
  List<Object?> get props => [day, comment, maxTemp, minTemp, iconURL];
}
