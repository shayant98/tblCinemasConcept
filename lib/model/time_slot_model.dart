class TimeSlot {
  final String id;
  final String start;
  final String end;
  final String type;
  final int seats;

  TimeSlot({this.seats, this.id, this.start, this.end, this.type});

  factory TimeSlot.fromMap(data) {
    return TimeSlot(
      id: data['id'],
      start: data['start'],
      end: data['end'],
      type: data['type'],
      seats: data['seats'],
    );
  }
}
