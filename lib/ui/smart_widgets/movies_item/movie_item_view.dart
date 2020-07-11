import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;

  const MovieItemWidget({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieItemViewModel>.reactive(
      builder: (context, model, child) => GestureDetector(
          onTap: () {
            model.navigateToMovieScreen(movie);
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.33,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(movie.poster ??
                        'https://www.joblo.com/assets/images/oldsite/posters/images/full/avengers-banneruk-2.jpg'))),
          )),
      viewModelBuilder: () => MovieItemViewModel(),
    );
  }
}
