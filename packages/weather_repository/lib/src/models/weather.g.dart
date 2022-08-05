// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      region: json['region'] as String? ?? "",
      currentConditions: CurrentConditions.fromJson(
          json['currentConditions'] as Map<String, dynamic>),
      nextDays: (json['next_days'] as List<dynamic>)
          .map((e) => NextDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'region': instance.region,
      'currentConditions': instance.currentConditions,
      'next_days': instance.nextDays,
    };
