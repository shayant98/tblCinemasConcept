import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/ticket_model.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class TicketViewModel extends StreamViewModel<List<Ticket>> {
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthService _authService = locator<AuthService>();
  @override
  Stream<List<Ticket>> get stream =>
      _firestoreService.listenToTicketsStream(_authService.currentUser);

  @override
  void onData(List<Ticket> data) {
    super.onData(data);
  }
}
