import 'package:bltCinemas/app/locator.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OverviewViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  int _dayCount = 10;
  DateFormat dateFormat = DateFormat("MMM d y");
  bool showHalfOff = false;
  int get dayCount => _dayCount;

  void goBack() {
    _navigationService.back();
  }

  void selectDay(int index) {
    _selectedIndex = index;
    DateTime dateCalculation = DateTime.now().add(Duration(days: index));
    if (dateCalculation.weekday == 2) {
      showHalfOff = true;
    } else {
      showHalfOff = false;
    }
    notifyListeners();
  }

  String buildDates(int index) {
    if (index == 0) {
      return 'Today';
    } else {
      DateTime dateCalculation = DateTime.now().add(Duration(days: index));

      return dateFormat.format(dateCalculation);
    }
  }
}
