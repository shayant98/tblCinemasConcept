import 'package:bltCinemas/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OverviewViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  int _dayCount = 10;
  int get dayCount => _dayCount;

  void goBack() {
    _navigationService.back();
  }

  void selectDay(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
