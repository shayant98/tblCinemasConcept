import 'dart:async';

import 'package:bltCinemas/model/article_model.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/model/overview_model.dart';
import 'package:bltCinemas/model/ticket_model.dart';
import 'package:bltCinemas/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _moviesCollectionReference =
      Firestore.instance.collection('movies');
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _articleCollectionReference =
      Firestore.instance.collection('articles');
  final CollectionReference _overviewCollectionReference =
      Firestore.instance.collection('overview');

  final StreamController<List<Movie>> _moviesController =
      StreamController<List<Movie>>.broadcast();
  final StreamController<List<Movie>> _moviesByCategoryController =
      StreamController<List<Movie>>.broadcast();
  final StreamController<User> _userController =
      StreamController<User>.broadcast();
  final StreamController<List<Article>> _articlesController =
      StreamController<List<Article>>.broadcast();
  final StreamController<List<Overview>> _overviewController =
      StreamController<List<Overview>>.broadcast();
  final StreamController<List<Ticket>> _ticketController =
      StreamController<List<Ticket>>.broadcast();

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

  updateUser(User user) {
    if (user != null) {
      DocumentReference userRef = _usersCollectionReference.document(user.id);
      return userRef.setData({
        'uid': user.id,
        'email': user.email,
        'photoUrl': user.photoUrl,
        'displayName': user.displayName,
        'lastSeen': DateTime.now(),
      }, merge: true);
    }
  }

  Future addCreditsToUser(String uid, double creditAmmount) async {
    if (uid != null) {
      DocumentReference userRef = _usersCollectionReference.document(uid);
      DocumentSnapshot userSnapshot = await userRef.get();
      return userRef.updateData(
        {'credits': (userSnapshot.data['credits'] ?? 0.00) + creditAmmount},
      );
    }
  }

  Stream<User> listenToUserStream(String uid) {
    _usersCollectionReference.document(uid).snapshots().listen((snapshot) {
      User userData = User.fromMap(snapshot);
      _userController.add(userData);
    });
    return _userController.stream;
  }

  Stream listenToArticlesStream() {
    _articleCollectionReference.snapshots().listen((articleSnapshot) {
      if (articleSnapshot.documents.isNotEmpty) {
        var articles = articleSnapshot.documents
            .map<Article>((snapshot) => Article.fromMap(snapshot))
            .where((article) =>
                article.title != null &&
                article.body != null &&
                article.imageUrl != null)
            .toList();

        _articlesController.add(articles);
      }
    });

    return _articlesController.stream;
  }

  Stream<List<Overview>> listenToOverViewStream(String date) {
    _overviewCollectionReference
        .document(date)
        .snapshots()
        .listen((overviewSnapshot) {
      if (overviewSnapshot.exists) {
        List<Overview> list = overviewSnapshot.data['movies']
            .map<Overview>((movie) => Overview.fromMap(movie))
            .toList();
        _overviewController.add(list);
      }
    });

    return _overviewController.stream;
  }

  Stream<List<Ticket>> listenToTicketsStream(String uid) {
    _usersCollectionReference
        .document(uid)
        .collection("tickets")
        .snapshots()
        .listen((ticketSnapshot) {
      if (ticketSnapshot.documents.isNotEmpty) {
        List<Ticket> tickets = ticketSnapshot.documents
            .map<Ticket>((snapshot) => Ticket.fromMap(snapshot))
            .where((ticket) => ticket.redeemed == false)
            .toList();

        _ticketController.add(tickets);
      }
    });

    return _ticketController.stream;
  }
}
