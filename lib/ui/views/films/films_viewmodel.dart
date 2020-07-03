import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:stacked/stacked.dart';

class FilmsViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();

  List<String> _categories;
  List<String> get categories => _categories;
  List<Movie> _movies;
  List<Movie> get movies => _movies;
  init() {
    _categories = _apiService.getAllCategories();
    _movies = _apiService.getAllMovies();
  }
}
