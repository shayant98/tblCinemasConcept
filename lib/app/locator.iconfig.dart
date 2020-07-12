// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:bltCinemas/services/third_party_services_module.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:bltCinemas/services/auth_service.dart';
import 'package:bltCinemas/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:bltCinemas/ui/views/films/films_viewmodel.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<ApiService>(
      () => thirdPartyServicesModule.apiService);
  g.registerLazySingleton<AuthService>(
      () => thirdPartyServicesModule.authService);
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<FirestoreService>(
      () => thirdPartyServicesModule.firestoreService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);

  //Eager singletons must be registered in the right order
  g.registerSingleton<DashboardViewModel>(DashboardViewModel());
  g.registerSingleton<FilmsViewModel>(FilmsViewModel());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  ApiService get apiService => ApiService();
  @override
  AuthService get authService => AuthService();
  @override
  DialogService get dialogService => DialogService();
  @override
  FirestoreService get firestoreService => FirestoreService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
