import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryButtonViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  ApiService _apiService = locator<ApiService>();

  navigateToCategoryView(String category) async {
    _apiService.setCurrentCategory(category);
    await _navigationService.navigateTo(Routes.categoryViewRoute);
  }
}
