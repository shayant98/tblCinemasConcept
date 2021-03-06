import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

class AppbarSearch extends SearchDelegate<String> {
  NavigationService _navigationService = locator<NavigationService>();
  ApiService _apiService = locator<ApiService>();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(FontAwesomeIcons.backspace),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        primaryColor: Theme.of(context).primaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              decorationColor: Colors.white,
            ));
  }

  @override
  String get searchFieldLabel => "Search Movies";

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Movie> allMovies = _apiService.getAllMovies();
    List<Movie> suggestions = allMovies
        .where(
            (movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.separated(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
          onTap: () async {
            _apiService.setCurrentMovie(suggestions[index]);
            _navigationService.back();
            await _navigationService.navigateTo(Routes.movieViewRoute);
          },
          leading: Image.asset(suggestions[index].poster),
          title: Text(suggestions[index].title)),
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
