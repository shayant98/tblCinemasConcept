import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String id;
  final String title;
  final String desc;
  final String poster;
  final List<String> categories;
  final bool nowShowing;
  final bool comingSoon;
  final String comingSoonDate;

  Movie({
    this.id,
    this.title,
    this.poster,
    this.desc,
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
      categories: documentSnapshot.data['categories'].cast<String>());
}
