import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class FilmsViewModel extends StreamViewModel {
  ApiService _apiService = locator<ApiService>();
  FirestoreService _firestoreService = locator<FirestoreService>();

  List<String> _categories;
  List<String> get categories => _categories;
  List<Movie> _movies;
  List<Movie> get movies => _movies;
  init() {
    _categories = _apiService.getAllCategories();
  }

  @override
  Stream<List<Movie>> get stream => _firestoreService.listenToMoviesStream();

  @override
  void onData(data) {
    super.onData(data);
  }
}
