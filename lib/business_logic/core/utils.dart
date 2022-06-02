import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lufthansa/business_logic/cubits/auth_token_cubit.dart';

// gets initial date used for the date pickers
String getInitialDate({required bool isFrom}) {
  final DateTime now = DateTime.now();
  if (isFrom) return DateFormat('dd MMMM yyyy').format(now);
  return DateFormat('dd MMMM yyyy').format(now.add(const Duration(days: 1)));
}

// checks if authToken stored in state is valid
bool checkTokenValidity({required BuildContext context}) {
  final DateTime now = DateTime.now();
  final DateTime? tokenExpiryTime =
      DateTime.tryParse(context.read<AuthTokenCubit>().state.expiryTime);
  if (now.isBefore(tokenExpiryTime ?? now.subtract(const Duration(days: 1)))) {
    return true;
  } else {
    return false;
  }
}
