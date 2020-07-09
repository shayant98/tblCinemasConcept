import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/ui/views/overview/overview_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  navigateToProfile() async {
    await _navigationService.navigateWithTransition(OverviewView(),
        transition: 'fade');
  }
}
