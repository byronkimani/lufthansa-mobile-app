part of 'auth_token_cubit.dart';

class AuthTokenState extends Equatable {
  const AuthTokenState({required this.authToken, required this.expiryTime});

  final String authToken;
  final String expiryTime;

  AuthTokenState copyWith({
    String? authToken,
    String? expiryTime,
  }) {
    final AuthTokenState authState = AuthTokenState(
      authToken: authToken ?? this.authToken,
      expiryTime: expiryTime ?? this.expiryTime,
    );
    return authState;
  }

  @override
  List<Object> get props => <Object>[authToken, expiryTime];
}
