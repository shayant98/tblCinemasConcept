import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String id;
  final String title;
  final String desc;
  final String poster;
  final int duration;
  final List<String> categories;
  final bool nowShowing;
  final bool comingSoon;
  final String comingSoonDate;

  Movie({
    this.id,
    this.title,
    this.poster,
    this.desc,
    this.duration,
    this.categories,
    this.nowShowing,
    this.comingSoon,
    this.comingSoonDate,
  });

  factory Movie.fromMap(DocumentSnapshot documentSnapshot) => Movie(
        id: documentSnapshot.documentID,
        title: documentSnapshot.data['title'],
        poster: documentSnapshot.data['poster'],
        desc: documentSnapshot.data['description'],
        duration: documentSnapshot.data['duration'],
        categories: documentSnapshot.data['categories'].cast<String>(),
        comingSoon: documentSnapshot.data['coming_soon'],
        nowShowing: documentSnapshot.data['now_showing'],
      );
}
