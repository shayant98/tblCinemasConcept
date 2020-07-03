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
                      movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.orange[600]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0, left: 8),
                    child: Text(
                      (movie.comingSoonDate != null)
                          ? movie.comingSoonDate
                          : "",
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
