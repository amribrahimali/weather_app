// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_conditions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentConditions _$CurrentConditionsFromJson(Map<String, dynamic> json) =>
    CurrentConditions(
      dayhour: json['dayhour'] as String? ?? '',
      temp: Temp.fromJson(json['temp'] as Map<String, dynamic>),
      precip: json['precip'] as String? ?? '',
      humidity: json['humidity'] as String? ?? '',
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      iconURL: json['iconURL'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$CurrentConditionsToJson(CurrentConditions instance) =>
    <String, dynamic>{
      'dayhour': instance.dayhour,
      'temp': instance.temp,
      'precip': instance.precip,
      'humidity': instance.humidity,
      'wind': instance.wind,
      'iconUrl': instance.iconURL,
      'comment': instance.comment,
    };
