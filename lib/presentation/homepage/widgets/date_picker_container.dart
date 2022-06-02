import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lufthansa/business_logic/cubits/booking_details_cubit.dart';

class DatePickerContainer extends StatefulWidget {
  const DatePickerContainer({
    Key? key,
    required this.title,
    required this.formattedDate,
    required this.isFrom,
  }) : super(key: key);

  final String title;
  final String formattedDate;
  final bool isFrom;

  @override
  State<DatePickerContainer> createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<DatePickerContainer> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
      onTap: () async {
        final DateTime now = DateTime.now();
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(now.year + 10),
        );
        if (selectedDate != null) {
          if (widget.isFrom) {
            context.read<BookingDetailsCubit>().updateFromDate(
                  fromDate: DateFormat('dd MM yyyy').format(selectedDate),
                );
          }
          context.read<BookingDetailsCubit>().updateToDate(
                toDate: DateFormat('dd MM yyyy').format(selectedDate),
              );
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
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
                widget.title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.formattedDate,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Icon(Icons.calendar_month, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
