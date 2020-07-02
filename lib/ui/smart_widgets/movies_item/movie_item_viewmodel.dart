import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieItemViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  navigateToMovieScreen() async {
    await _navigationService.navigateTo(Routes.movieViewRoute);
  }
}
