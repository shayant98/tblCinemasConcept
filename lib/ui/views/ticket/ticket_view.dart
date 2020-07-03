import 'package:bltCinemas/ui/views/startup/startup_viewmodel.dart';
import 'package:bltCinemas/ui/views/ticket/ticket_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ticket_pass_package/ticket_pass.dart';

class TicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TicketViewModel>.reactive(
      builder: (context, model, child) => Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Text(
              "Ticket",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.orange[600]),
            ),
            TicketPass(
                child: Container(
              color: Colors.orange[600],
            ))
          ],
        ),
      )),
      viewModelBuilder: () => TicketViewModel(),
    );
  }
}
