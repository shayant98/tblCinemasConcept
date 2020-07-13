import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/user_model.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:bltCinemas/services/qrcode_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends StreamViewModel<User> {
  NavigationService _navigationService = locator<NavigationService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthService _authService = locator<AuthService>();
  QRcodeService _qRcodeService = locator<QRcodeService>();

  Future<void> logout() async {
    await _authService.logout();
    navigateToHome();
  }

  void navigateToHome() {
    _navigationService.back();
  }

  addCredit(ammount) {
    if (ammount != null || ammount <= 0) {
      _firestoreService.addCreditsToUser(_authService.currentUser, ammount);
    }
  }

  initScan() {
    var scan = _qRcodeService.startScan();
    if (scan is bool) {
      addCredit(_qRcodeService.scanValue.trim() as double);
    }
  }

  @override
  Stream<User> get stream =>
      _firestoreService.listenToUserStream(_authService.currentUser);
}
