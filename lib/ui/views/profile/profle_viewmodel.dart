import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  AuthService _authService = locator<AuthService>();
  Future<void> logout() async {
    await _authService.logout();
    navigateToHome();
  }

  void navigateToHome() {
    _navigationService.back();
  }
}
