import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lufthansa/data/models/flight.dart';

part 'available_flights_state.dart';

class AvailableFlightsCubit extends Cubit<AvailableFlightsState> {
  AvailableFlightsCubit()
      : super(
          const AvailableFlightsState(
            flightsList: <Flight>[],
          ),
        );

  Future<void> fetchAvailableFlights() async {}
}
