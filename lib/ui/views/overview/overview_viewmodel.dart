import 'dart:math';

import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/overview_model.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OverviewViewModel extends StreamViewModel<List<Overview>> {
  NavigationService _navigationService = locator<NavigationService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  int _dayCount = 7;
  DateFormat dateFormat = DateFormat("ddMMyy");
  DateFormat listDateFormat = DateFormat("MMM dd yy");
  bool showHalfOff = false;
  int get dayCount => _dayCount;
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  void goBack() {
    _navigationService.back();
  }

  void selectDay(int index) {
    _selectedIndex = index;
    DateTime dateCalculation = DateTime.now().add(Duration(days: index));
    _selectedDate = dateCalculation;
    if (dateCalculation.weekday == 2) {
      showHalfOff = true;
    } else {
      showHalfOff = false;
    }

    notifyListeners();
    notifySourceChanged(clearOldData: true);
  }

  String buildDates(int index) {
    if (index == 0) {
      return 'Today';
    } else {
      DateTime dateCalculation = DateTime.now().add(Duration(days: index));

      return listDateFormat.format(dateCalculation);
    }
  }

  @override
  Stream<List<Overview>> get stream => _firestoreService
      .listenToOverViewStream(dateFormat.format(_selectedDate));

  @override
  void onError(error) {
    print(error);
    super.onError(error);
  }
}
