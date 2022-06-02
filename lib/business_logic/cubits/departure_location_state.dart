part of 'departure_location_cubit.dart';

class DepartureLocationState extends Equatable {
  const DepartureLocationState({
    required this.selectedLocation,
    required this.locationsList,
  });

  final Location selectedLocation;
  final List<Location> locationsList;

  @override
  List<Object> get props => <Object>[selectedLocation];

  DepartureLocationState copyWith({
    Location? selectedLocation,
    List<Location>? locationsList,
  }) {
    final DepartureLocationState departureLocationState =
        DepartureLocationState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locationsList: locationsList ?? this.locationsList,
    );
    return departureLocationState;
  }
}
