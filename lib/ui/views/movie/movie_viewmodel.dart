import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();
  NavigationService _navigationService = locator<NavigationService>();

  Movie _currentMovie;
  Movie get currentMovie => _currentMovie;
  bool _showFullDesc = false;
  bool _showFullTitle = false;
  bool get showFullDesc => _showFullDesc;
  bool get showFullTitle => _showFullTitle;

  init() {
    _currentMovie = _apiService.getCurrentMovie();
    if (currentMovie.title.length < 140) {
      _showFullTitle = true;
    }
  }

  void toggleDesc() {
    _showFullDesc = !showFullDesc;
    notifyListeners();
  }

  void toggleTitle() {
    _showFullTitle = !_showFullTitle;
    notifyListeners();
  }

  navigateToTicketsView() async {
    _navigationService.navigateTo(Routes.screenTimesViewRoute);
  }
}
