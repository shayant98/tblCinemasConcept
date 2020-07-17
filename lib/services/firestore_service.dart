import 'dart:async';

import 'package:bltCinemas/model/article_model.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/model/parent_time_slot_model.dart';
import 'package:bltCinemas/model/showing_model.dart';
import 'package:bltCinemas/model/ticket_model.dart';
import 'package:bltCinemas/model/time_slot_model.dart';
import 'package:bltCinemas/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _moviesCollectionReference =
      Firestore.instance.collection('movies');
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _articleCollectionReference =
      Firestore.instance.collection('articles');
  final CollectionReference _timeSlotCollectionReference =
      Firestore.instance.collection('overview');

  final StreamController<List<Movie>> _moviesController =
      StreamController<List<Movie>>.broadcast();
  final StreamController<List<Movie>> _moviesByCategoryController =
      StreamController<List<Movie>>.broadcast();
  final StreamController<User> _userController =
      StreamController<User>.broadcast();
  final StreamController<List<Article>> _articlesController =
      StreamController<List<Article>>.broadcast();
  final StreamController<List<Ticket>> _ticketController =
      StreamController<List<Ticket>>.broadcast();
  final StreamController<List<Showing>> _showingsController =
      StreamController<List<Showing>>.broadcast();
  final StreamController<ParentTimeSlot> _timeSlotController =
      StreamController<ParentTimeSlot>.broadcast();

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

  Future<Movie> getMovieById(String id) async {
    DocumentSnapshot snapshot =
        await _moviesCollectionReference.document(id).get();
    if (snapshot.exists) {
      return Movie.fromMap(snapshot);
    }
    return null;
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

  Stream<List<Showing>> listenToShowingsStream(String date) {
    Firestore.instance
        .collectionGroup('showings')
        .where('date', isEqualTo: date)
        .snapshots()
        .listen((showingsSnapshot) {
      if (showingsSnapshot.documents.isNotEmpty) {
        List<Showing> showings = showingsSnapshot.documents
            .map<Showing>((snapshot) => Showing.fromMap(snapshot))
            .toList();

        _showingsController.add(showings);
      }
    });
    return _showingsController.stream;
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

  Future<ParentTimeSlot> listenToTimeslotStream(String id) async {
    DocumentSnapshot snapshot =
        await _timeSlotCollectionReference.document(id).get();

    if (snapshot.exists) return ParentTimeSlot.fromMap(snapshot);
  }

  Future<bool> createTicket(
    String slotId,
    String userId,
    int kids,
    int adult,
    Movie movie,
    String date,
    String time,
  ) async {
    CollectionReference ticketCollection =
        _usersCollectionReference.document(userId).collection("tickets");

    Ticket ticket = Ticket(
      showingId: slotId,
      title: movie.title,
      screen: 2,
      time: time,
      purchaseDate: Timestamp.now(),
      kids: kids,
      adults: adult,
      redeemed: false,
      date: date,
      code: "TEST123",
      categories: movie.categories,
    );
    try {
      DocumentReference ticketRecord =
          await ticketCollection.add(ticket.toJson());

      return ticketRecord != null;
    } catch (e) {
      return e.message;
    }
  }
}
