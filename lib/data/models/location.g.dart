// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      airport: json['airport'] as String,
      code: json['code'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'code': instance.code,
      'airport': instance.airport,
      'country': instance.country,
    };
