import 'package:bltCinemas/ui/views/ticket/ticket_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
            return Ticket();
          },
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      )),
      viewModelBuilder: () => TicketViewModel(),
    );
  }
}

class Ticket extends ViewModelWidget<TicketViewModel> {
  @override
  Widget build(BuildContext context, TicketViewModel model) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: QrImage(
                    size: 250,
                    data: "Suck ya muda",
                  ),
                ),
                Text(
                  "987654321",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width * 0.60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                        width: 48, image: AssetImage('assets/images/tbl.png')),
                    Flexible(
                      child: Text(
                        "The Lion King",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Text(
                      "2h 15min",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.grey),
                    ),
                    Text(
                      "Horror",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.grey),
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InfoContainer(
                          title: "Date",
                          value: "23/12/20",
                        ),
                        VerticalDivider(),
                        InfoContainer(
                          title: "Time",
                          value: "23:00",
                        ),
                        VerticalDivider(),
                        InfoContainer(
                          title: "Screen",
                          value: "1",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            QrCode(),
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String title;
  final String value;

  const InfoContainer({@required this.title, @required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.grey),
          ),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class QrCode extends StatelessWidget {
  const QrCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  QrImage(
                    data: "Suck ya muda",
                    version: QrVersions.auto,
                  ),
                  Text(
                    "987654321",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                FontAwesomeIcons.expandArrowsAlt,
                color: Colors.black,
                size: 21,
              ),
            )
          ],
        ),
      ),
    );
  }
}
