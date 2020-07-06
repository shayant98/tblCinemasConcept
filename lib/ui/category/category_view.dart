import 'package:bltCinemas/ui/category/category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => CategoryViewModel(),
    );
  }
}
