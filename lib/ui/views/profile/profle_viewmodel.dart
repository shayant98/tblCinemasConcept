import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/user_model.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:bltCinemas/services/qrcode_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends StreamViewModel<User> {
  NavigationService _navigationService = locator<NavigationService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthService _authService = locator<AuthService>();
  QRcodeService _qRcodeService = locator<QRcodeService>();
  SnackbarService _snackbarService = locator<SnackbarService>();

  TextEditingController _codeInputEditingController = TextEditingController();
  TextEditingController get codeInputEditingController =>
      _codeInputEditingController;

  Future<void> logout() async {
    await _authService.logout();
    navigateToHome();
  }

  void navigateToHome() {
    _navigationService.back();
  }

  addCredit(ammount) async {
    if (ammount != null) {
      await _firestoreService.addCreditsToUser(
          _authService.currentUser, ammount);

      _snackbarService.showCustomSnackBar(
          message: "Added \$$ammount to wallet",
          isDismissible: true,
          duration: Duration(seconds: 2));
    } else {
      _snackbarService.showCustomSnackBar(
          title: "Credit Error",
          message: "Invalid credit ammount",
          isDismissible: true,
          duration: Duration(seconds: 2));
    }
  }

  double parseValue(String value) {
    return double.tryParse(_codeInputEditingController.text.trim());
  }

  addCreditByCode() {
    double value = parseValue(_codeInputEditingController.text);
    addCredit(value);
    _codeInputEditingController.text = "";
    _navigationService.popRepeated(2);
  }

  initScan() async {
    _navigationService.back();
    dynamic scan = await _qRcodeService.startScan();
    if (scan is bool) {
      double value = parseValue(_qRcodeService.scanValue.trim());
      addCredit(value);
    }
  }

  @override
  Stream<User> get stream =>
      _firestoreService.listenToUserStream(_authService.currentUser);
}
