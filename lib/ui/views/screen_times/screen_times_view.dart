import 'package:bltCinemas/ui/views/screen_times/screen_times_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ScreenTimesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScreenTimesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => ScreenTimesViewModel(),
    );
  }
}
