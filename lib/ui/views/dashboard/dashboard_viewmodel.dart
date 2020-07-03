import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();

  List<Movie> _movies;
  List<Movie> get movies => _movies;
  init() {
    _movies = _apiService.getAllMovies();
  }
}
