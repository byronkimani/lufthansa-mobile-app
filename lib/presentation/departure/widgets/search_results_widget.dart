import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lufthansa/business_logic/cubits/departure_location_cubit.dart';
import 'package:lufthansa/data/models/location.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartureLocationCubit, DepartureLocationState>(
      builder: (BuildContext context, DepartureLocationState state) {
        final List<Widget> widgetList = <Widget>[];
        final List<Location> locationsList =
            context.read<DepartureLocationCubit>().state.locationsList;
        if (locationsList.isNotEmpty) {
          for (Location location in locationsList) {
            widgetList.add(
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          location.airport,
                          style: TextStyle(fontSize: 16),
                        )),
                    const SizedBox(width: 5),
                    Expanded(
                        child: Text(
                      location.code,
                      style: TextStyle(fontSize: 16),
                    )),
                    const SizedBox(width: 5),
                    Expanded(
                        child: Text(
                      location.country,
                      style: TextStyle(fontSize: 16),
                    )),
                  ],
                ),
              ),
            );
          }
        } else {
          widgetList.add(
            const Text('No data was found please try again using another city'),
          );
        }
        return Container(
          width: double.infinity,
          child: Column(
            children: widgetList,
          ),
        );
      },
    );
  }
}
