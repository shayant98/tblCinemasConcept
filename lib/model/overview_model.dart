import 'package:bltCinemas/model/time_slot_model.dart';

class Overview {
  final String title;
  final String poster;
  final List<TimeSlot> slots;

  Overview({this.title, this.poster, this.slots});

  factory Overview.fromMap(dynamic data) {
    return Overview(
        title: data['title'],
        poster: data['poster'],
        slots: data['slots']
            .map<TimeSlot>((slot) => TimeSlot.fromMap(slot))
            .toList());
  }
}
