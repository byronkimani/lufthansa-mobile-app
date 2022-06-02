import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lufthansa/business_logic/cubits/arrival_location_cubit.dart';
import 'package:lufthansa/data/constants/asset_strings.dart';
import 'package:lufthansa/presentation/core/loading_indicator.dart';
import 'package:lufthansa/presentation/departure/widgets/search_results_widget.dart';

import '../../core/custom_textfield.dart';

class ArrivalPage extends StatefulWidget {
  const ArrivalPage({Key? key}) : super(key: key);

  @override
  State<ArrivalPage> createState() => _ArrivalPageState();
}

class _ArrivalPageState extends State<ArrivalPage> {
  TextEditingController? searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: SvgPicture.asset(arrivalImage),
              ),
              const SizedBox(height: 20),
              const Text(
                'What is your preferred departure destination?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    await context
                        .read<ArrivalLocationCubit>()
                        .updateDepartureLocation(
                          cityName: searchController!.text,
                        );
                  },
                ),
                hintText: 'Enter a city name',
                onFieldSubmitted: (String query) async {
                  await context
                      .read<ArrivalLocationCubit>()
                      .updateDepartureLocation(cityName: query);
                },
                textEditingController: searchController,
              ),
              const SizedBox(height: 20),
              BlocBuilder<ArrivalLocationCubit, ArrivalLocationState>(
                builder: (BuildContext context, ArrivalLocationState state) {
                  if (!state.isLoading) {
                    if (state.noLocationsFound) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'No data was found. Please try another city name',
                        ),
                      );
                    }
                    return SearchResultsWidget(
                      locationList: state.locationsList,
                    );
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
