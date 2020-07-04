import 'package:bltCinemas/ui/views/ticket/ticket_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class TicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TicketViewModel>.reactive(
      builder: (context, model, child) => Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            for (var i = 0; i < 4; i++)
              return Card(
                color: Colors.white,
              );
          },
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      )),
      viewModelBuilder: () => TicketViewModel(),
    );
  }
}
