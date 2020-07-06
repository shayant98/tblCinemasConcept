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

abstract class Routes {
  static const startupViewRoute = '/startup-view-route';
  static const homeViewRoute = '/';
  static const movieViewRoute = '/movie-view-route';
  static const filmsViewRoute = '/films-view-route';
  static const ticketViewRoute = '/ticket-view-route';
  static const overviewViewRoute = '/overview-view-route';
  static const screenTimesViewRoute = '/screen-times-view-route';
  static const categoryViewRoute = '/category-view-route';
  static const all = {
    startupViewRoute,
    homeViewRoute,
    movieViewRoute,
    filmsViewRoute,
    ticketViewRoute,
    overviewViewRoute,
    screenTimesViewRoute,
    categoryViewRoute,
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
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
