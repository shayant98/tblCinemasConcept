import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/model/parent_time_slot_model.dart';
import 'package:bltCinemas/model/ticket_model.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:local_auth/local_auth.dart';

class PurchaseViewModel extends FutureViewModel<ParentTimeSlot> {
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthService _authService = locator<AuthService>();
  bool bioAuth;
  LocalAuthentication localAuth = LocalAuthentication();

  final String id;
  final Movie movie;

  int _adultCounter = 0;

  PurchaseViewModel({this.id, this.movie});

  int get adultCounter => _adultCounter;
  int _kidsCounter = 0;
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
    notifyListeners();
  }

  init() async {
    bioAuth = await localAuth.canCheckBiometrics;
  }

  buyTicket() async {
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
          print("created");
        }
      } else {
        print(ticket);
      }
    } else {}
  }

  @override
  Future<ParentTimeSlot> futureToRun() {
    return _firestoreService.listenToTimeslotStream(id);
  }
}
