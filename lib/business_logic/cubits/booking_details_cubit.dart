import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lufthansa/business_logic/core/utils.dart';

part 'booking_details_state.dart';

class BookingDetailsCubit extends Cubit<BookingDetailsState> {
  BookingDetailsCubit()
      : super(
          // initial values
          BookingDetailsState(
            fromDate: getInitialDate(isFrom: true),
            toDate: getInitialDate(isFrom: false),
          ),
        );

  void updateFromDate({required String fromDate}) {
    emit(state.copyWith(fromDate: fromDate));
  }

  void updateToDate({required String toDate}) {
    emit(state.copyWith(toDate: toDate));
  }
}
