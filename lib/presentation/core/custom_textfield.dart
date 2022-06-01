import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.onSaved,
    required this.validator,
    required this.hintText,
    required this.title,
    required this.location,
  }) : super(key: key);

  final void Function(String? value) onSaved;
  final String? Function(String? value) validator;
  final String hintText;
  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            const SizedBox(height: 5),
            Text(
              location,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
