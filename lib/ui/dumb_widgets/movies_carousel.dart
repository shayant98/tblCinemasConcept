import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:flutter/material.dart';

class MoviesCarousel extends StatelessWidget {
  final int movies;

  const MoviesCarousel({this.movies});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            for (var i = 0; i < movies; i++) return MovieItemWidget();
          },
          itemCount: movies,
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
