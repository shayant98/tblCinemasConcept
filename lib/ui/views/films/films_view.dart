import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/smart_widgets/category_button/category_button_view.dart';
import 'package:bltCinemas/ui/dumb_widgets/movies_carousel.dart';
import 'package:bltCinemas/ui/views/films/films_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class FilmsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilmsViewModel>.reactive(
      builder: (context, model, child) => ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          for (var i = 0; i < model.categories.length; i++)
            Column(
              children: <Widget>[
                CategoryButtonView(
                  categoryName: model.categories[i],
                ),
                buildMoviesCarousel(model.categories[i], model.data),
              ],
            ),
        ],
      ),
      viewModelBuilder: () => FilmsViewModel(),
      onModelReady: (model) => model.init(),
    );
  }

  Widget buildMoviesCarousel(String category, List<Movie> movies) {
    List<Movie> categoryMovies = [];

    for (Movie movie in movies) {
      if (movie.categories.contains(category.toLowerCase())) {
        categoryMovies..add(movie);
      }
    }

    return categoryMovies.isEmpty
        ? Container()
        : MoviesCarousel(
            movies: categoryMovies,
          );
  }
}
