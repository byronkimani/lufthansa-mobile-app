import 'package:flutter/material.dart';
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
        child: Column(
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
              children: const <Widget>[
                DatePickerContainer(
                  title: 'Departure',
                  formattedDate: '1 June 2022',
                ),
                SizedBox(width: 20),
                DatePickerContainer(
                  title: 'Return',
                  formattedDate: '30 June 2022',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
