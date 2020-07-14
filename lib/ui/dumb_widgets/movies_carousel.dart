import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:flutter/material.dart';

class MoviesCarousel extends StatelessWidget {
  final List<Movie> movies;

  const MoviesCarousel({this.movies});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.separated(
          key: PageStorageKey('movie-carousel'),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return MovieItemWidget(
              movie: movies[index],
            );
          },
          itemCount: movies.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }
}
