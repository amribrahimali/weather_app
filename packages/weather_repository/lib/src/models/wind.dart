import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind extends Equatable {
  const Wind({this.km, this.mile});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  final int? km;
  final int? mile;

  @override
  List<Object?> get props => [km, mile];
}
