import 'package:flutter/material.dart';
import 'package:lufthansa/presentation/homepage/widgets/booking_details_form.dart';
import 'package:lufthansa/presentation/homepage/widgets/custom_sliver_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String token = context.read<AuthTokenCubit>().updateAuthToken();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const BookingDetailsForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
