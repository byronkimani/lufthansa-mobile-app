part of 'arrival_location_cubit.dart';

class ArrivalLocationState extends Equatable {
  const ArrivalLocationState({
    required this.selectedLocation,
    required this.locationsList,
  });

  final Location selectedLocation;
  final List<Location> locationsList;

  @override
  List<Object> get props => <Object>[selectedLocation];

  ArrivalLocationState copyWith({
    Location? selectedLocation,
    List<Location>? locationsList,
  }) {
    final ArrivalLocationState arrivalLocationState = ArrivalLocationState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locationsList: locationsList ?? this.locationsList,
    );
    return arrivalLocationState;
  }
}
