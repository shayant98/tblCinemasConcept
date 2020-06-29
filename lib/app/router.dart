import 'package:auto_route/auto_route_annotations.dart';
import 'package:bltCinemas/ui/views/home/home_view.dart';
import 'package:bltCinemas/ui/views/startup/startup_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
  HomeView homeViewRoute;
}
