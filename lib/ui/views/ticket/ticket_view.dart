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
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(color: Color(0xFF363636)),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/lion_king.jpg"),
                    ),
                    VerticalDivider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Title",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            "The Lion King",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Divider(),
                          Text(
                            "Date",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "20-02-02",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "18: 30",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                          Divider(),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.orange[600],
                            child: Icon(FontAwesomeIcons.qrcode),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
