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
      'airport': instance.airport,
      'code': instance.code,
      'country': instance.country,
    };
