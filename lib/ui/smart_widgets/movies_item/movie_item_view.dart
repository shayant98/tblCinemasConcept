import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: movie.poster,
                placeholder: (context, url) => Center(
                    child: LimitedBox(
                  maxHeight: 30,
                  child: CircularProgressIndicator(),
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          )),
      viewModelBuilder: () => MovieItemViewModel(),
    );
  }
}
