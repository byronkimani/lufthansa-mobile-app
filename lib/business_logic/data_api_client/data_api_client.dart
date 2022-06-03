import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lufthansa/business_logic/core/utils.dart';
import 'package:lufthansa/business_logic/cubits/auth_token_cubit.dart';
import 'package:lufthansa/data/constants/constants.dart';
import 'package:lufthansa/data/models/auth_token.dart';
import 'package:lufthansa/data/models/flight.dart';
import 'package:lufthansa/data/models/location.dart';

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

  Future<List<Location>> SearchByCityName({required String query}) async {
    late Response<dynamic> response;
    final Dio dio = Dio();
    dio.options = BaseOptions(
      queryParameters: autosuggestFilter(query: query),
    );
    try {
      response = await dio.get(
        'https://www.lufthansa.com/service/autosuggest/airport',
      );

      if (response.data != null) {
        final List<Location> locationsList = <Location>[];
        final Map<String, dynamic> data = response.data;
        final List<dynamic> locationsListMap = data['items'];
        for (dynamic locationJson in locationsListMap) {
          if ((locationJson as Map<String, dynamic>).containsKey('area')) {
            for (dynamic areaLocationJson
                in locationJson['items'] as List<dynamic>) {
              locationsList.add(Location.fromJson(areaLocationJson));
            }
          } else {
            locationsList.add(Location.fromJson(locationJson));
          }
        }
        return locationsList;
      }
    } catch (e) {
      return <Location>[];
    }
    return <Location>[];
  }

  Future<List<Flight>> fetchFlights({
    required String origin,
    required String destination,
    required BuildContext context,
  }) async {
    refreshToken(context: context);
    final String token = context.read<AuthTokenCubit>().state.authToken;
    late Response<dynamic> response;
    final String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final Dio dio = Dio();
    dio.options = BaseOptions(
      queryParameters: <String, dynamic>{
        'serviceType': 'passenger',
        'limit': 20,
        'offset': 0
      },
      baseUrl: 'https://api.lufthansa.com/',
      headers: <String, dynamic>{'Authorization': 'Bearer $token'},
    );

    try {
      response = await dio
          .get('v1/operations/flightstatus/route/$origin/$destination/$date');
      if (response.data != null) {
        final List<Flight> flightsList = <Flight>[];
        final List<dynamic> data =
            response.data['FlightStatusResource']['Flights']['Flight'];
        for (dynamic flight in data) {
          flightsList.add(Flight.fromJson(flight));
        }
        return flightsList;
      }
    } catch (e) {
      return <Flight>[];
    }
    return <Flight>[];
  }
}
