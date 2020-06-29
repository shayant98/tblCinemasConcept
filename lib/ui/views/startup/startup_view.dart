import 'package:bltCinemas/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}
