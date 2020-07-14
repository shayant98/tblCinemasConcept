import 'package:auto_route/auto_route_annotations.dart';
import 'package:bltCinemas/ui/views/articles/articles_view.dart';
import 'package:bltCinemas/ui/views/category/category_view.dart';
import 'package:bltCinemas/ui/views/email_login/email_login_view.dart';
import 'package:bltCinemas/ui/views/email_register/email_register_view.dart';
import 'package:bltCinemas/ui/views/films/films_view.dart';
import 'package:bltCinemas/ui/views/home/home_view.dart';
import 'package:bltCinemas/ui/views/login/login_view.dart';
import 'package:bltCinemas/ui/views/movie/movie_view.dart';
import 'package:bltCinemas/ui/views/overview/overview_view.dart';
import 'package:bltCinemas/ui/views/profile/profile_view.dart';
import 'package:bltCinemas/ui/views/screen_times/screen_times_view.dart';
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
  ScreenTimesView screenTimesViewRoute;
  CategoryView categoryViewRoute;
  LoginView loginViewRoute;
  ProfileView profileViewRoute;
  ArticlesView articlesViewRoute;
  EmailLoginView emailLoginViewRoute;
  EmailRegisterView emailRegisterView;
}
