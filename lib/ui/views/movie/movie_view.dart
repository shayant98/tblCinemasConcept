import 'package:bltCinemas/ui/views/movie/movie_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => MovieViewModel(),
    );
  }
}
