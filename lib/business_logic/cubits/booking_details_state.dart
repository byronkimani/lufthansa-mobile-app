part of 'booking_details_cubit.dart';

class BookingDetailsState extends Equatable {
  const BookingDetailsState({
    required this.fromDate,
    required this.toDate,
  });

  final String fromDate;
  final String toDate;

  @override
  List<Object> get props => <Object>[fromDate, toDate];

  BookingDetailsState copyWith({String? fromDate, String? toDate}) {
    final BookingDetailsState bookingDetailsState = BookingDetailsState(
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
    return bookingDetailsState;
  }
}
