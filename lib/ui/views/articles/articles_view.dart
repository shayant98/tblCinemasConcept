import 'package:bltCinemas/ui/views/articles/articles_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ArticlesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticlesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => ArticlesViewModel(),
    );
  }
}
