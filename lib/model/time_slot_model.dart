import 'package:cloud_firestore/cloud_firestore.dart';

class TimeSlot {
  final String start;
  final String end;
  final String type;

  TimeSlot({this.start, this.end, this.type});

  factory TimeSlot.fromMap(data) {
    return TimeSlot(
      start: data['start'],
      end: data['end'],
      type: data['type'],
    );
  }
}
