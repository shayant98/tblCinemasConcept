import 'package:auto_route/auto_route_annotations.dart';
import 'package:bltCinemas/ui/views/films/films_view.dart';
import 'package:bltCinemas/ui/views/home/home_view.dart';
import 'package:bltCinemas/ui/views/movie/movie_view.dart';
import 'package:bltCinemas/ui/views/overview/overview_view.dart';
import 'package:bltCinemas/ui/views/startup/startup_view.dart';
import 'package:bltCinemas/ui/views/ticket/ticket_view.dart';

@MaterialAutoRouter()
class $Router {
  StartupView startupViewRoute;
  @initial
  HomeView homeViewRoute;
  MovieView movieViewRoute;
  FilmsView filmsViewRoute;
  TicketView ticketViewRoute;
  OverviewView overviewViewRoute;
}
