import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lufthansa/business_logic/data_api_client/data_api_client.dart';
import 'package:lufthansa/data/models/flight.dart';

part 'available_flights_state.dart';

class AvailableFlightsCubit extends Cubit<AvailableFlightsState> {
  AvailableFlightsCubit()
      : super(
          const AvailableFlightsState(
            flightsList: <Flight>[],
            isLoading: false,
            noFlightsFound: false,
          ),
        );

  Future<void> fetchAvailableFlights({
    required String origin,
    required String destination,
    required BuildContext context,
  }) async {
    emit(state.copyWith(isLoading: true));
    final List<Flight> flightList = await DataApiClient().fetchFlights(
      origin: origin,
      destination: destination,
      context: context,
    );
    if (flightList.isEmpty) {
      emit(state.copyWith(noFlightsFound: true, isLoading: false));
    }
    emit(state.copyWith(flightsList: flightList, isLoading: false));
  }
}
