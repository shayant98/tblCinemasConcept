import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String id;
  final String title;
  final String body;
  final bool isFeatured;
  final Timestamp date;
  final String imageUrl;
  final String subTitle;

  Article(
      {this.id,
      this.title,
      this.body,
      this.isFeatured,
      this.date,
      this.imageUrl,
      this.subTitle});

  factory Article.fromMap(DocumentSnapshot snapshot) => Article(
        id: snapshot.documentID,
        title: snapshot.data['title'],
        body: snapshot.data['body'],
        isFeatured: snapshot.data['featured'],
        date: snapshot.data['date'],
        imageUrl: snapshot.data['image'],
        subTitle: snapshot.data['sub_title'],
      );
}
