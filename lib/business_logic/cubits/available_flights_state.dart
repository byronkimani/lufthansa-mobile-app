part of 'available_flights_cubit.dart';

class AvailableFlightsState extends Equatable {
  const AvailableFlightsState({
    required this.flightsList,
    this.selectedFlight,
  });

  final List<Flight> flightsList;
  final Flight? selectedFlight;

  @override
  List<Object?> get props => <Object?>[flightsList, selectedFlight];
}
