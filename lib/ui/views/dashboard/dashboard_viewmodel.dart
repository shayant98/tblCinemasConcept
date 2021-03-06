import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@singleton
class DashboardViewModel extends StreamViewModel {
  FirestoreService _firestoreService = locator<FirestoreService>();

  List<Movie> _movies;
  List<Movie> get movies => _movies;

  @override
  Stream<List<Movie>> get stream =>
      _firestoreService.listenToMoviesByCategoryStream('now showing');
}
