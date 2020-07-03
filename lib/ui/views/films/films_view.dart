import 'dart:math';

import 'package:bltCinemas/model/movie_model.dart';
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
            height: 20,
          ),
          for (var i = 0; i < model.categories.length; i++)
            Column(
              children: <Widget>[
                CategoryButtonWidget(
                  categoryName: model.categories[i],
                ),
                SizedBox(
                  height: 5,
                ),
                buildMoviesCarousel(model.categories[i], model.movies),
                SizedBox(
                  height: 30,
                )
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

class CategoryButtonWidget extends StatelessWidget {
  final String categoryName;

  const CategoryButtonWidget({Key key, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.orange[600].withOpacity(0.2),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              categoryName,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                  ),
            ),
            Row(
              children: <Widget>[
                Text(
                  "View More",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Colors.orange[600],
                      ),
                ),
                Icon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.orange[600],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
