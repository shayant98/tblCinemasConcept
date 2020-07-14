import 'package:bltCinemas/ui/views/ticket/ticket_viewmodel.dart';
import 'package:flutter/material.dart';
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
          itemCount: 1,
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
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
                      fontWeight: FontWeight.bold, color: Colors.white),
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
                color: Color(0xFF363636),
                borderRadius: BorderRadius.circular(20),
              ),
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
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Text(
                      "2h 15min",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Horror",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.white),
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InfoContainer(
                          title: "Date",
                          value: "23/12/20",
                          subInfo: false,
                        ),
                        VerticalDivider(),
                        InfoContainer(
                          title: "Time",
                          value: "23:00",
                          subInfo: false,
                        ),
                        VerticalDivider(),
                        InfoContainer(
                          title: "Screen",
                          value: "1",
                          subInfo: false,
                        ),
                        VerticalDivider(),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InfoContainer(
                          title: "Adult(s)",
                          value: "2",
                        ),
                        InfoContainer(
                          title: "Child(ren)",
                          value: "2",
                        ),
                        InfoContainer(
                          title: "PAID",
                          value: "\$4333",
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
  final bool subInfo;
  const InfoContainer(
      {@required this.title, @required this.value, this.subInfo});
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
                .copyWith(color: Colors.white),
          ),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: (subInfo == false)
                ? Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                : Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
            color: Color(0xFF363636), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  QrImage(
                    foregroundColor: Colors.orange[600],
                    data: "Suck ya muda",
                    version: QrVersions.auto,
                  ),
                  Text(
                    "987654321",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                FontAwesomeIcons.expandArrowsAlt,
                color: Colors.white,
                size: 21,
              ),
            )
          ],
        ),
      ),
    );
  }
}
