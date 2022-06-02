import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lufthansa/business_logic/data_api_client/data_api_client.dart';
import 'package:lufthansa/data/models/location.dart';

part 'departure_location_state.dart';

class DepartureLocationCubit extends Cubit<DepartureLocationState> {
  DepartureLocationCubit()
      : super(
          // initial values
          const DepartureLocationState(
            selectedLocation: Location(airport: '', code: '', country: ''),
            locationsList: <Location>[],
            isLoading: false,
            noLocationsFound: false,
          ),
        );

  Future<void> updateDepartureLocation({required String cityName}) async {
    emit(state.copyWith(isLoading: true));
    final List<Location> locationsList =
        await DataApiClient().SearchByCityName(query: cityName);
    if (locationsList.isEmpty) {
      emit(state.copyWith(noLocationsFound: true));
    }
    emit(state.copyWith(locationsList: locationsList, isLoading: false));
  }
}
