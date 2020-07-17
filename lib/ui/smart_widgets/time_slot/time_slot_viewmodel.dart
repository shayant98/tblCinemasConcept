import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TimeSlotWidgetViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  navigateToPurchaseScreen(
    String id,
    Movie movie,
  ) async {
    await _navigationService.navigateTo(Routes.purchaseViewModelRoute,
        arguments: PurchaseViewArguments(id: id, movie: movie));
  }
}
