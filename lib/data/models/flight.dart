import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight.g.dart';

@JsonSerializable()
class Flight extends Equatable {
  const Flight({
    required this.departure,
    required this.arrival,
    required this.marketingCarrier,
    required this.operatingCarrier,
    required this.equipment,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);

  Map<String, dynamic> toJson() => _$FlightToJson(this);

  final Map<String, dynamic> arrival;
  final Map<String, dynamic> departure;
  final Map<String, dynamic> equipment;
  final Map<String, dynamic> marketingCarrier;
  final Map<String, dynamic> operatingCarrier;

  @override
  List<Object?> get props => <Object?>[
        arrival,
        departure,
        equipment,
        marketingCarrier,
        operatingCarrier,
      ];
}
