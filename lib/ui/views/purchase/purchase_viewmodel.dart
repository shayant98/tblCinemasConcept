import 'dart:async';

import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/model/parent_time_slot_model.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PurchaseViewModel extends FutureViewModel<ParentTimeSlot> {
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthService _authService = locator<AuthService>();
  SnackbarService _snackbarService = locator<SnackbarService>();

  StreamSubscription _loggedInUserSubscription;
  final String id;
  final Movie movie;

  int _adultCounter = 0;
  int _kidsCounter = 0;

  double userCredits = 0;
  double totalCost = 0;
  double remainingCredit;
  PurchaseViewModel({this.id, this.movie});

  int get adultCounter => _adultCounter;

  int get kidsCounter => _kidsCounter;

  addToOption(String option) {
    switch (option) {
      case 'adult':
        _adultCounter++;
        break;
      case 'kids':
        _kidsCounter++;
        break;
      default:
    }
    calculateCost();
    notifyListeners();
  }

  subtractToOption(String option) {
    switch (option) {
      case 'adult':
        if (_adultCounter > 0) _adultCounter--;
        break;
      case 'kids':
        if (_kidsCounter > 0) _kidsCounter--;
        break;
      default:
    }
    calculateCost();
    notifyListeners();
  }

  init() async {
    if (_authService.currentUser != null) {
      _loggedInUserSubscription = _firestoreService
          .listenToUserStream(_authService.currentUser)
          .listen((user) {
        userCredits = user.credits;
      });
    }
  }

  calculateCost() {
    double adultCost = _adultCounter.toDouble() * data.price;
    double kidsCost = _kidsCounter.toDouble() * data.kidsPrice;
    totalCost = double.parse((adultCost + kidsCost).toStringAsFixed(2));
    remainingCredit =
        double.parse((userCredits - totalCost).toStringAsFixed(2));
  }

  buyTicket() async {
    // var authenticated = await _localAuthService.authenticate();
    if (remainingCredit < 0.00) {
      buildSnackbar(
          "Error", FontAwesomeIcons.timesCircle, "Not enough credits");
      return;
    }
    if (_adultCounter == 0 && _kidsCounter == 0) {
      buildSnackbar("Error", FontAwesomeIcons.timesCircle,
          "Please add atleast one (1) ticket option before purchasing");
      return;
    }
    if (_authService.currentUser != null) {
      setBusy(true);
      var ticket = await _firestoreService.createTicket(
          id,
          _authService.currentUser,
          _kidsCounter,
          _adultCounter,
          movie,
          data.date,
          data.start);
      setBusy(false);
      if (ticket is bool) {
        if (ticket) {
          buildSnackbar("Success", FontAwesomeIcons.checkCircle,
              "Your ticket for ${movie.title} has been succesfully purchased");
        }
      } else {
        buildSnackbar("Error", FontAwesomeIcons.timesCircle, "$ticket");
      }
    } else {}
  }

  @override
  Future<ParentTimeSlot> futureToRun() {
    return _firestoreService.listenToTimeslotStream(id);
  }

  buildSnackbar(String title, IconData icon, String message) {
    _snackbarService.showCustomSnackBar(
        isDismissible: true,
        duration: Duration(seconds: 5),
        title: title,
        shouldIconPulse: true,
        icon: Icon(
          icon,
          color: Colors.orange[600],
        ),
        message: message);
  }

  @override
  void onData(ParentTimeSlot data) {
    calculateCost();
    super.onData(data);
  }

  @override
  void dispose() {
    _loggedInUserSubscription.cancel();
    super.dispose();
  }
}
