import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  const Location({
    required this.airport,
    required this.code,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  // airport name
  final String airport;

  // airport code
  final String code;

  final String country;

  @override
  List<Object?> get props => <Object>[airport, code, country];

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
