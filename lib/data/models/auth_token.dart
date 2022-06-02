import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken extends Equatable {
  final String access_token;
  final int expires_in;

  const AuthToken({
    required this.access_token,
    required this.expires_in,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);

  @override
  List<Object?> get props => <Object>[access_token, expires_in];
}
