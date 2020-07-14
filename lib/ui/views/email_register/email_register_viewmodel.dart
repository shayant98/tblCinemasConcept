import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailRegisterViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  NavigationService _navigationService = locator<NavigationService>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNametNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNametNameController => _lastNametNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get passwordController => _passwordController;

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setBusy(true);
      var result = await _authService.signUpWithEmail(
          _firstNameController.text.trim(),
          _lastNametNameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim());
      setBusy(false);
      if (result is bool) {
        if (result) {
          navigateToProfile();
        } else {
          _snackbarService.showCustomSnackBar(
              message: "sign up failed. Please try again later",
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

  String validateFirstName(String val) {
    if (val.length == 0) {
      return "Please give a first name";
    }
    return null;
  }

  String validateLastName(String val) {
    if (val.length == 0) {
      return "Please give a last name";
    }
    return null;
  }

  String validateEmail(String val) {
    if (val.length == 0) {
      return "Please give a email";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val)) {
      return "Please give a valid email";
    }
    return null;
  }

  String validatePassword(String val) {
    if (val.length == 0) {
      return "Please give a password";
    }
    if (val.length < 6) {
      return "Password is too short";
    }
    return null;
  }

  String validateConfirmPassword(String val) {
    if (val.length == 0) {
      return "Please repeat your password";
    }
    if (val != passwordController.text) {
      return "passwords aren't identical";
    }
    return null;
  }

  navigateToLogin() async {
    await _navigationService.navigateTo(Routes.emailLoginViewRoute);
  }

  navigateToProfile() async {
    await _navigationService.navigateTo(Routes.profileViewRoute);
  }
}
