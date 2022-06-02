import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.onFieldSubmitted,
    this.hintText,
    this.suffixIcon,
    this.textEditingController,
  }) : super(key: key);

  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final void Function(String query)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        controller: textEditingController,
        onFieldSubmitted: onFieldSubmitted,
        // onEditingComplete: onEditingComplete,
      ),
    );
  }
}
