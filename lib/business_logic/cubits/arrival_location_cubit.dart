import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lufthansa/business_logic/data_api_client/data_api_client.dart';
import 'package:lufthansa/data/models/location.dart';

part  'arrival_location_state.dart';

class ArrivalLocationCubit extends Cubit<ArrivalLocationState> {
  ArrivalLocationCubit()
      : super(
          // initial values
          const ArrivalLocationState(
            selectedLocation: Location(airport: '', code: '', country: ''),
            locationsList: <Location>[],
          ),
        );

  Future<void> updateDepartureLocation({required String cityName}) async {
    final List<Location> locationsList =
        await DataApiClient().SearchByCityName(query: cityName);
    emit(state.copyWith(locationsList: locationsList));
  }
}
