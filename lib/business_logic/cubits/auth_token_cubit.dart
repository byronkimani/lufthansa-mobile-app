import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:lufthansa/business_logic/data_api_client/data_api_client.dart';
import 'package:lufthansa/data/models/auth_token.dart';

part 'auth_token_state.dart';

class AuthTokenCubit extends Cubit<AuthTokenState> {
  AuthTokenCubit()
      : super(
          const AuthTokenState(authToken: '', expiryTime: ''),
        );

  Future<void> getAuthToken() async {
    final AuthToken authToken = await DataApiClient().fetchAuthToken(
      clientId: FlutterConfig.get('CLIENT_ID'),
      clientSecret: FlutterConfig.get('CLIENT_SECRET'),
    );
    final DateTime tokenExpiryDateTime = DateTime.now().add(
      Duration(seconds: authToken.expires_in),
    );
    emit(
      state.copyWith(
        authToken: authToken.access_token,
        expiryTime: tokenExpiryDateTime.toString(),
      ),
    );
  }
}
