import 'package:bltCinemas/model/ticket_model.dart';
import 'package:bltCinemas/ui/views/ticket/ticket_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';

class TicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TicketViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return TicketWidget(
              ticket: model.data[index],
            );
          },
          itemCount: (model.dataReady) ? model.data.length : 0,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 20,
            );
          },
        ),
      ),
      viewModelBuilder: () => TicketViewModel(),
    );
  }
}

class TicketWidget extends StatelessWidget {
  final Ticket ticket;

  const TicketWidget({@required this.ticket});
  @override
  Widget build(BuildContext context) {
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
                  child: QrImage(size: 250, data: ticket.code),
                ),
                Text(
                  ticket.code,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          ),
        );
      },
      child: Container(
        height: 230,
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
                        ticket.title,
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
                          value: ticket.date,
                          subInfo: false,
                        ),
                        VerticalDivider(),
                        InfoContainer(
                          title: "Time",
                          value: ticket.time,
                          subInfo: false,
                        ),
                        VerticalDivider(),
                        InfoContainer(
                          title: "Screen",
                          value: ticket.screen,
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
                          value: ticket.adults,
                        ),
                        InfoContainer(title: "Child(ren)", value: ticket.kids),
                      ],
                    )
                  ],
                ),
              ),
            ),
            QrCode(code: ticket.code),
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String title;
  final value;
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
            "$value",
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
  final String code;

  const QrCode({
    this.code,
  });

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
                    data: code,
                    version: QrVersions.auto,
                  ),
                  Text(
                    code,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  FontAwesomeIcons.expandArrowsAlt,
                  color: Colors.white,
                  size: 21,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
