part of 'arrival_location_cubit.dart';

class ArrivalLocationState extends Equatable {
  const ArrivalLocationState({
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

  ArrivalLocationState copyWith({
    Location? selectedLocation,
    List<Location>? locationsList,
    bool? isLoading,
    bool? noLocationsFound,
  }) {
    final ArrivalLocationState arrivalLocationState = ArrivalLocationState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locationsList: locationsList ?? this.locationsList,
      isLoading: isLoading ?? this.isLoading,
      noLocationsFound: noLocationsFound ?? this.noLocationsFound,
    );
    return arrivalLocationState;
  }
}
