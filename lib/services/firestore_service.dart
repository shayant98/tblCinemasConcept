import 'dart:async';

import 'package:bltCinemas/model/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _moviesCollectionReference =
      Firestore.instance.collection('movies');
  final StreamController<List<Movie>> _moviesController =
      StreamController<List<Movie>>.broadcast();

  Stream listenToMoviesStream() {
    _moviesCollectionReference.snapshots().listen((moviesSnapshot) {
      if (moviesSnapshot.documents.isNotEmpty) {
        var exercises = moviesSnapshot.documents
            .map<Movie>((snapshot) => Movie.fromMap(snapshot))
            .toList();

        _moviesController.add(exercises);
      }
    });

    return _moviesController.stream;
  }
}
