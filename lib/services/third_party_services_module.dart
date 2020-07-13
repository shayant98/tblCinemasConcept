import 'package:bltCinemas/services/api_service.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:bltCinemas/services/qrcode_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackbarService;
  @lazySingleton
  ApiService get apiService;
  @lazySingleton
  FirestoreService get firestoreService;
  @lazySingleton
  AuthService get authService;
  @lazySingleton
  QRcodeService get qRcodeService;
}
