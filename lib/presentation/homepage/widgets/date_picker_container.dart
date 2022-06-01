import 'package:flutter/material.dart';

class DatePickerContainer extends StatelessWidget {
  const DatePickerContainer({
    Key? key,
    required this.title,
    required this.formattedDate,
  }) : super(key: key);

  final String title;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 2;
    return Container(
      height: 120,
      width: width - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              formattedDate,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Icon(Icons.calendar_month, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
