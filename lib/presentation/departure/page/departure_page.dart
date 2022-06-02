import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lufthansa/business_logic/cubits/departure_location_cubit.dart';
import 'package:lufthansa/data/constants/asset_strings.dart';
import 'package:lufthansa/presentation/core/custom_textfield.dart';
import 'package:lufthansa/presentation/core/loading_indicator.dart';
import 'package:lufthansa/presentation/departure/widgets/search_results_widget.dart';

class DeparturePage extends StatefulWidget {
  const DeparturePage({Key? key}) : super(key: key);

  @override
  State<DeparturePage> createState() => _DeparturePageState();
}

class _DeparturePageState extends State<DeparturePage> {
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
                child: SvgPicture.asset(departureImage),
              ),
              const SizedBox(height: 20),
              const Text(
                'What is your preferred departure location?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    await context
                        .read<DepartureLocationCubit>()
                        .updateDepartureLocation(
                          cityName: searchController!.text,
                        );
                  },
                ),
                hintText: 'Enter a city name',
                onFieldSubmitted: (String query) async {
                  await context
                      .read<DepartureLocationCubit>()
                      .updateDepartureLocation(cityName: query);
                },
                textEditingController: searchController,
              ),
              const SizedBox(height: 20),
              BlocBuilder<DepartureLocationCubit, DepartureLocationState>(
                builder: (BuildContext context, DepartureLocationState state) {
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
