part of 'reservation_bloc.dart';

class ReservationEvent {
  ReservationEvent({
    required this.doctorName,
    required this.doctorId,
    required this.location,
    required this.token,
  });
  final String doctorId;
  final String doctorName;
  final String location;
  final String token;
}
