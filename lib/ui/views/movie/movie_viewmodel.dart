import 'package:bltCinemas/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  bool _showFullDesc = false;
  bool get showFullDesc => _showFullDesc;

  void toggleDesc() {
    _showFullDesc = !showFullDesc;
    notifyListeners();
  }
}
