// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextDay _$NextDayFromJson(Map<String, dynamic> json) => NextDay(
      day: json['day'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      maxTemp: Temp.fromJson(json['max_temp'] as Map<String, dynamic>),
      minTemp: Temp.fromJson(json['min_temp'] as Map<String, dynamic>),
      iconURL: json['iconURL'] as String? ?? '',
    );

Map<String, dynamic> _$NextDayToJson(NextDay instance) => <String, dynamic>{
      'day': instance.day,
      'comment': instance.comment,
      'max_temp': instance.maxTemp,
      'min_temp': instance.minTemp,
      'iconUrl': instance.iconURL,
    };
