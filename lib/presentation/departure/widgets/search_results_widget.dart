import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lufthansa/business_logic/cubits/departure_location_cubit.dart';
import 'package:lufthansa/data/models/location.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({
    Key? key,
    required this.locationList,
  }) : super(key: key);

  final List<Location> locationList;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = <Widget>[];
    final List<Location> locationsList =
        context.read<DepartureLocationCubit>().state.locationsList;
    if (locationsList.isNotEmpty) {
      for (Location location in locationsList) {
        widgetList.add(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    location.airport,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    location.code,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    location.country,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } else {
      widgetList.add(
        const Text('Please enter a city name and tap on one from the list'),
      );
    }
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: widgetList,
      ),
    );
  }
}
