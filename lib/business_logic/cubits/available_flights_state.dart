part of 'available_flights_cubit.dart';

class AvailableFlightsState extends Equatable {
  const AvailableFlightsState({
    required this.isLoading,
    required this.noFlightsFound,
    required this.flightsList,
    this.selectedFlight,
  });

  final List<Flight> flightsList;
  final Flight? selectedFlight;
  final bool isLoading;
  final bool noFlightsFound;

  AvailableFlightsState copyWith({
    Flight? selectedFlight,
    List<Flight>? flightsList,
    bool? isLoading,
    bool? noFlightsFound,
  }) {
    final AvailableFlightsState availableFlightsState = AvailableFlightsState(
      selectedFlight: selectedFlight ?? this.selectedFlight,
      flightsList: flightsList ?? this.flightsList,
      isLoading: isLoading ?? this.isLoading,
      noFlightsFound: noFlightsFound ?? this.noFlightsFound,
    );
    return availableFlightsState;
  }

  @override
  List<Object?> get props =>
      <Object?>[flightsList, selectedFlight, isLoading, noFlightsFound];
}
