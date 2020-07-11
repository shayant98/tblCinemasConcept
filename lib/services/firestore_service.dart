import 'dart:async';

import 'package:bltCinemas/model/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference _moviesCollectionReference =
      Firestore.instance.collection('movies');
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final StreamController<List<Movie>> _moviesController =
      StreamController<List<Movie>>.broadcast();
  final StreamController<List<Movie>> _moviesByCategoryController =
      StreamController<List<Movie>>.broadcast();
  Stream listenToMoviesStream() {
    _moviesCollectionReference.snapshots().listen((moviesSnapshot) {
      if (moviesSnapshot.documents.isNotEmpty) {
        var movies = moviesSnapshot.documents
            .map<Movie>((snapshot) => Movie.fromMap(snapshot))
            .toList();

        _moviesController.add(movies);
      }
    });

    return _moviesController.stream;
  }

  Stream listenToMoviesByCategoryStream(String category) {
    print(category);
    bool isCategory = false;
    bool isNowShowing = false;
    bool isComingSoon = false;

    switch (category.trim()) {
      case 'coming soon':
        isComingSoon = true;
        break;
      case 'now showing':
        isNowShowing = true;
        break;
      default:
        isCategory = true;
    }
    _moviesCollectionReference
        .where('now_showing', isEqualTo: (isNowShowing) ? true : null)
        .where('coming_soon', isEqualTo: (isComingSoon) ? true : null)
        .where('categories', arrayContains: (isCategory) ? category : null)
        .snapshots()
        .listen((moviesSnapshot) {
      if (moviesSnapshot.documents.isNotEmpty) {
        var movies = moviesSnapshot.documents
            .map<Movie>((snapshot) => Movie.fromMap(snapshot))
            .toList();

        _moviesByCategoryController.add(movies);
      }
    });
    return _moviesByCategoryController.stream;
  }

  updateUser(FirebaseUser user) {
    DocumentReference userRef = _usersCollectionReference.document(user.uid);
    print(userRef);
    return userRef.setData({
      'uid': user.uid,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }
}
