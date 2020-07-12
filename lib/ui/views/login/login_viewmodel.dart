import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/ui/views/home/home_view.dart';
import 'package:bltCinemas/ui/views/overview/overview_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();

  googleLogIn() async {
    await _authService.loginWithGoogle();
    navigateToProfile();
  }

  navigateToProfile() async {
    await _navigationService.replaceWith(Routes.profileViewRoute);
  }

  init() async {
    if (await _authService.isUserLoggedIn()) navigateToProfile();
  }
}
