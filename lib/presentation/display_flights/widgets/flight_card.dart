import 'package:flutter/material.dart';
import 'package:lufthansa/data/models/flight.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({
    Key? key,
    required this.flightsList,
  }) : super(key: key);
  final List<Flight> flightsList;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = <Widget>[];
    if (flightsList.isNotEmpty) {
      for (Flight flight in flightsList) {
        widgetList.add(
          InkWell(
            onTap: () {},
            child: Column(
              children: <Text>[Text('${flight.arrival['AirportCode']}')],
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
