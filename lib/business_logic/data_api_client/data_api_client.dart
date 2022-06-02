import 'package:dio/dio.dart';
import 'package:lufthansa/data/models/auth_token.dart';

class DataApiClient {
  Future<AuthToken> fetchAuthToken({
    required String clientId,
    required String clientSecret,
  }) async {
    final Response<dynamic> response;
    final Map<String, dynamic> data = <String, dynamic>{
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': 'client_credentials'
    };
    final Dio dio = Dio();

    dio.options.contentType = Headers.formUrlEncodedContentType;
    response = await dio.post(
      'https://api.lufthansa.com/v1/oauth/token',
      data: data,
    );
    if (response.data != null) {
      return AuthToken.fromJson(response.data);
    } else {
      return const AuthToken(access_token: '', expires_in: 1);
    }
  }
}
