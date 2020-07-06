import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:stacked/stacked.dart';

class CategoryViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();
  List<Movie> _movies;
  List<Movie> get movies => _movies;
  String _currentCategory;
  String get currentCategory => _currentCategory;
  init() {
    _currentCategory = _apiService.getCurrentCategory();
    _movies = _apiService.getMoviesByCategory(_currentCategory.toLowerCase());
  }
}
