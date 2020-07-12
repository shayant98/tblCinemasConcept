import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String displayName;
  final String email;
  final String photoUrl;
  final double credits;

  User({this.id, this.displayName, this.email, this.photoUrl, this.credits});

  factory User.fromMap(DocumentSnapshot snapshot) {
    return User(
      id: snapshot.documentID,
      displayName: snapshot.data['displayName'],
      email: snapshot.data['email'],
      photoUrl: snapshot.data['photoUrl'],
      credits: snapshot.data['credits'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': id,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}
