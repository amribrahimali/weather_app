import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable()
class Temp extends Equatable {
  const Temp({this.c, this.f});

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);

  final int? c;
  final int? f;

  @override
  List<Object?> get props => [c, f];
}
