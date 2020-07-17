import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailLoginViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  login() async {
    if (_formKey.currentState.validate()) {
      setBusy(true);
      var result = await _authService.loginWithEmail(
          _emailController.text.trim(), _passwordController.text.trim());
      setBusy(false);
      if (result is bool) {
        if (result) {
          navigateToProfile();
        } else {
          _snackbarService.showCustomSnackBar(
              message: "sign in failed. Please try again later",
              isDismissible: true,
              duration: Duration(seconds: 5));
        }
      } else {
        _snackbarService.showCustomSnackBar(
            message: result,
            isDismissible: true,
            duration: Duration(seconds: 5));
      }
    }
  }

  String validateEmail(String val) {
    if (val.length == 0) {
      return "Please give a email";
    }
    return null;
  }

  String validatePassword(String val) {
    if (val.length == 0) {
      return "Please give a password";
    }
    return null;
  }

  navigateToSignUp() async {
    await _navigationService.navigateTo(Routes.emailRegisterViewRoute);
  }

  navigateToProfile() async {
    await _navigationService.navigateTo(Routes.profileViewRoute);
  }
}
