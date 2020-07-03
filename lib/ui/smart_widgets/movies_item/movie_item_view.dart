import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key key,
  }) : super(key: key);
// https://images.wallpapersden.com/image/download/bloodshot-movie-4k-poster_68757_6072x9000.jpg
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieItemViewModel>.reactive(
      builder: (context, model, child) => Ink(
        child: InkWell(
          onTap: () {
            model.navigateToMovieScreen();
          },
          splashColor: Colors.orange[600],
          child: Container(
              margin: EdgeInsets.only(),
              color: Color(0xFF262626),
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Image(
                          width: MediaQuery.of(context).size.width * 0.40,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/lion_king.jpg'))),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 8),
                    child: Text(
                      "TITLE",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.orange[600]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0, left: 8),
                    child: Text(
                      "SUBTITLE",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              )),
        ),
      ),
      viewModelBuilder: () => MovieItemViewModel(),
    );
  }
}
