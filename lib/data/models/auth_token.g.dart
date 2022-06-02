// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      access_token: json['access_token'] as String,
      expires_in: json['expires_in'] as int,
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'expires_in': instance.expires_in,
    };
