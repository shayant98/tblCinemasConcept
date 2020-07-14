import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/ui/views/home/home_view.dart';
import 'package:bltCinemas/ui/views/overview/overview_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  AuthService _authService = locator<AuthService>();

  googleLogIn() async {
    var result = await _authService.loginWithGoogle();
    if (result is bool) {
      if (result) {
        navigateToProfile();
      } else {
        showSnackbar('Login Failure', 'Google login failed, please try again');
      }
    } else {
      showSnackbar('Login Failure', 'Google login failed, please try again');
    }
  }

  navigateToProfile() async {
    await _navigationService.replaceWith(Routes.profileViewRoute);
  }

  navigateToEmailLogin() async {
    await _navigationService.navigateTo(Routes.emailLoginViewRoute);
  }

  navigateToEmailRegister() async {
    await _navigationService.navigateTo(Routes.emailRegisterView);
  }

  init() async {
    if (await _authService.isUserLoggedIn()) navigateToProfile();
  }

  showSnackbar(String title, String body) {
    _snackbarService.showCustomSnackBar(
        message: body,
        title: title,
        isDismissible: true,
        duration: Duration(seconds: 2));
  }
}
