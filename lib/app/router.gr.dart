// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bltCinemas/ui/views/startup/startup_view.dart';
import 'package:bltCinemas/ui/views/home/home_view.dart';
import 'package:bltCinemas/ui/views/movie/movie_view.dart';
import 'package:bltCinemas/ui/views/films/films_view.dart';
import 'package:bltCinemas/ui/views/ticket/ticket_view.dart';
import 'package:bltCinemas/ui/views/overview/overview_view.dart';
import 'package:bltCinemas/ui/views/screen_times/screen_times_view.dart';
import 'package:bltCinemas/ui/views/category/category_view.dart';
import 'package:bltCinemas/ui/views/login/login_view.dart';
import 'package:bltCinemas/ui/views/profile/profile_view.dart';
import 'package:bltCinemas/ui/views/articles/articles_view.dart';
import 'package:bltCinemas/ui/views/email_login/email_login_view.dart';
import 'package:bltCinemas/ui/views/email_register/email_register_view.dart';
import 'package:bltCinemas/ui/views/purchase/purchase_view.dart';
import 'package:bltCinemas/model/movie_model.dart';

abstract class Routes {
  static const startupViewRoute = '/startup-view-route';
  static const homeViewRoute = '/';
  static const movieViewRoute = '/movie-view-route';
  static const filmsViewRoute = '/films-view-route';
  static const ticketViewRoute = '/ticket-view-route';
  static const overviewViewRoute = '/overview-view-route';
  static const screenTimesViewRoute = '/screen-times-view-route';
  static const categoryViewRoute = '/category-view-route';
  static const loginViewRoute = '/login-view-route';
  static const profileViewRoute = '/profile-view-route';
  static const articlesViewRoute = '/articles-view-route';
  static const emailLoginViewRoute = '/email-login-view-route';
  static const emailRegisterViewRoute = '/email-register-view-route';
  static const purchaseViewModelRoute = '/purchase-view-model-route';
  static const all = {
    startupViewRoute,
    homeViewRoute,
    movieViewRoute,
    filmsViewRoute,
    ticketViewRoute,
    overviewViewRoute,
    screenTimesViewRoute,
    categoryViewRoute,
    loginViewRoute,
    profileViewRoute,
    articlesViewRoute,
    emailLoginViewRoute,
    emailRegisterViewRoute,
    purchaseViewModelRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.startupViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartupView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.movieViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MovieView(),
          settings: settings,
        );
      case Routes.filmsViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => FilmsView(),
          settings: settings,
        );
      case Routes.ticketViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => TicketView(),
          settings: settings,
        );
      case Routes.overviewViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => OverviewView(),
          settings: settings,
        );
      case Routes.screenTimesViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ScreenTimesView(),
          settings: settings,
        );
      case Routes.categoryViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => CategoryView(),
          settings: settings,
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case Routes.profileViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProfileView(),
          settings: settings,
        );
      case Routes.articlesViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ArticlesView(),
          settings: settings,
        );
      case Routes.emailLoginViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => EmailLoginView(),
          settings: settings,
        );
      case Routes.emailRegisterViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => EmailRegisterView(),
          settings: settings,
        );
      case Routes.purchaseViewModelRoute:
        if (hasInvalidArgs<PurchaseViewArguments>(args)) {
          return misTypedArgsRoute<PurchaseViewArguments>(args);
        }
        final typedArgs =
            args as PurchaseViewArguments ?? PurchaseViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => PurchaseView(
              key: typedArgs.key, id: typedArgs.id, movie: typedArgs.movie),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//PurchaseView arguments holder class
class PurchaseViewArguments {
  final Key key;
  final String id;
  final Movie movie;
  PurchaseViewArguments({this.key, this.id, this.movie});
}
