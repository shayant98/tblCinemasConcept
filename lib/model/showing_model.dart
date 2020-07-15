import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/model/time_slot_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Showing {
  Movie movie;
  final String title;
  final String id;
  final String parentId;
  final String poster;
  final List<TimeSlot> slots;

  Showing(
      {this.movie,
      this.id,
      this.parentId,
      this.title,
      this.poster,
      this.slots});

  factory Showing.fromMap(DocumentSnapshot snapshot) {
    return Showing(
        id: snapshot.documentID,
        parentId: snapshot.reference.parent().parent().documentID,
        title: snapshot.data['title'],
        poster: snapshot.data['poster'],
        slots: snapshot.data['slots']
            .map<TimeSlot>((slot) => TimeSlot.fromMap(slot))
            .toList());
  }
}
