import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lufthansa/business_logic/cubits/arrival_location_cubit.dart';
import 'package:lufthansa/business_logic/cubits/available_flights_cubit.dart';
import 'package:lufthansa/business_logic/cubits/departure_location_cubit.dart';
import 'package:lufthansa/data/models/flight.dart';
import 'package:lufthansa/presentation/core/loading_indicator.dart';
import 'package:lufthansa/presentation/display_flights/widgets/flight_card.dart';

class DisplayFlightsPage extends StatefulWidget {
  const DisplayFlightsPage({Key? key}) : super(key: key);

  @override
  State<DisplayFlightsPage> createState() => _DisplayFlightsPageState();
}

class _DisplayFlightsPageState extends State<DisplayFlightsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      final String origin =
          context.read<DepartureLocationCubit>().state.selectedLocation!.code;

      final String destination =
          context.read<ArrivalLocationCubit>().state.selectedLocation!.code;

      context.read<AvailableFlightsCubit>().fetchAvailableFlights(
            origin: origin,
            destination: destination,
            context: context,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<AvailableFlightsCubit, AvailableFlightsState>(
                builder: (BuildContext context, AvailableFlightsState state) {
                  if (!state.isLoading) {
                    if (state.noFlightsFound) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'No data was found. Please try again later',
                        ),
                      );
                    }
                    if (state.flightsList.isEmpty) {
                      return const SizedBox();
                    }
                    return FlightCard(flightsList: state.flightsList);
                  } else {
                    return const SizedBox(
                      height: 200,
                      child: LoadingIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
