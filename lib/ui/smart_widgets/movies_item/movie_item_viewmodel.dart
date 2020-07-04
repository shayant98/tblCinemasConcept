import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieItemViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  ApiService _apiService = locator<ApiService>();

  navigateToMovieScreen(Movie movie) async {
    try {
      setCurrentMovie(movie);
      await _navigationService.navigateTo(Routes.movieViewRoute);
    } on Exception catch (e) {
      print(e);
    }
  }

  setCurrentMovie(Movie movie) {
    _apiService.setCurrentMovie(movie);
  }
}
