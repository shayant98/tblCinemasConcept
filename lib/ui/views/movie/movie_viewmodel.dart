import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:stacked/stacked.dart';

class MovieViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();

  Movie _currentMovie;
  Movie get currentMovie => _currentMovie;

  init() {
    _currentMovie = _apiService.getCurrentMovie();
    print("${_apiService.getCurrentMovie()} TEST");
  }

  bool _showFullDesc = false;
  bool get showFullDesc => _showFullDesc;

  void toggleDesc() {
    _showFullDesc = !showFullDesc;
    notifyListeners();
  }
}
