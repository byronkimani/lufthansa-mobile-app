part of 'departure_location_cubit.dart';

class DepartureLocationState extends Equatable {
  const DepartureLocationState({
    required this.selectedLocation,
    required this.locationsList,
    required this.isLoading,
    required this.noLocationsFound,
  });

  final Location? selectedLocation;
  final List<Location> locationsList;
  final bool isLoading;
  final bool noLocationsFound;

  @override
  List<Object?> get props => <Object?>[
        selectedLocation,
        locationsList,
        isLoading,
        noLocationsFound,
      ];

  DepartureLocationState copyWith({
    Location? selectedLocation,
    List<Location>? locationsList,
    bool? isLoading,
    bool? noLocationsFound,
  }) {
    final DepartureLocationState departureLocationState =
        DepartureLocationState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locationsList: locationsList ?? this.locationsList,
      isLoading: isLoading ?? this.isLoading,
      noLocationsFound: noLocationsFound ?? this.noLocationsFound,
    );
    return departureLocationState;
  }
}
