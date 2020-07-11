import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class CategoryViewModel extends StreamViewModel {
  ApiService _apiService = locator<ApiService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  List<Movie> _movies;
  List<Movie> get movies => _movies;
  String _currentCategory;
  String get currentCategory => _currentCategory;
  init() {
    _currentCategory = _apiService.getCurrentCategory();
  }

  @override
  Stream<List<Movie>> get stream =>
      _firestoreService.listenToMoviesByCategoryStream(
          _apiService.getCurrentCategory().toLowerCase());
}
