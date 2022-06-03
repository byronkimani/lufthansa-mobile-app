// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flight _$FlightFromJson(Map<String, dynamic> json) => Flight(
      departure: json['Departure'] as Map<String, dynamic>,
      arrival: json['Arrival'] as Map<String, dynamic>,
      marketingCarrier: json['MarketingCarrier'] as Map<String, dynamic>,
      operatingCarrier: json['OperatingCarrier'] as Map<String, dynamic>,
      equipment: json['Equipment'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$FlightToJson(Flight instance) => <String, dynamic>{
      'arrival': instance.arrival,
      'departure': instance.departure,
      'equipment': instance.equipment,
      'marketingCarrier': instance.marketingCarrier,
      'operatingCarrier': instance.operatingCarrier,
    };
