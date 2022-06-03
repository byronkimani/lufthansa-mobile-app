import 'package:flutter/material.dart';
import 'package:lufthansa/business_logic/core/utils.dart';
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
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              formatDate(
                                flight.departure['ScheduledTimeLocal']
                                    ['DateTime'],
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${flight.departure['AirportCode']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${flight.departure['TimeStatus']['Definition']}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Terminal: ${flight.departure['Terminal']['Name']}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Gate: ${flight.departure['Terminal']['Gate']}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              formatDate(
                                flight.arrival['ScheduledTimeLocal']
                                    ['DateTime'],
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${flight.arrival['AirportCode']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${flight.departure['TimeStatus']['Definition']}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Terminal: ${flight.departure['Terminal']['Name']}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Gate: ${flight.departure['Terminal']['Gate']}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Marketing Carrier: ${flight.marketingCarrier['AirlineID']} ${flight.marketingCarrier['FlightNumber']}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
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
