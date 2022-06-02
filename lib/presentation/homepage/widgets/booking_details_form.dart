import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lufthansa/business_logic/cubits/booking_details_cubit.dart';
import 'package:lufthansa/presentation/core/custom_textfield.dart';
import 'package:lufthansa/presentation/homepage/widgets/date_picker_container.dart';

class BookingDetailsForm extends StatefulWidget {
  const BookingDetailsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingDetailsForm> createState() => _BookingDetailsFormState();
}

Map<String, dynamic> data = <String, dynamic>{};

class _BookingDetailsFormState extends State<BookingDetailsForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Form(
        key: formKey,
        child: BlocBuilder<BookingDetailsCubit, BookingDetailsState>(
          builder: (BuildContext context, BookingDetailsState state) {
            return Column(
              children: <Widget>[
                CustomTextField(
                  title: 'From',
                  hintText: 'nameHint',
                  location: 'Nairobi',
                  onSaved: (String? v) => data['name'] = v.toString().trim(),
                  validator: (String? value) {},
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  title: 'From',
                  hintText: 'nameHint',
                  location: 'Nairobi',
                  onSaved: (String? v) => data['name'] = v.toString().trim(),
                  validator: (String? value) {},
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    DatePickerContainer(
                      title: 'Departure',
                      formattedDate: state.fromDate,
                      isFrom: true,
                    ),
                    const SizedBox(width: 20),
                    DatePickerContainer(
                      title: 'Return',
                      formattedDate: state.toDate,
                      isFrom: false,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'SEARCH FLIGHT',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
