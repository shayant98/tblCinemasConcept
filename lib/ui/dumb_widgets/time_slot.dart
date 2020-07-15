import 'package:bltCinemas/model/time_slot_model.dart';
import 'package:bltCinemas/ui/dumb_widgets/flat_busy_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimeSlotWidget extends StatelessWidget {
  final TimeSlot slot;
  final DateTime currentDate;

  const TimeSlotWidget({this.slot, this.currentDate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showModalBottomSheet(context: context, builder: (_) => Container());
      },
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (_) => Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Seats Left: ${slot.seats}",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Adult",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(FontAwesomeIcons.minusCircle),
                                onPressed: () {},
                              ),
                              Text(
                                "0",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.plusCircle),
                                onPressed: () {},
                              )
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Kids",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(FontAwesomeIcons.minusCircle),
                                onPressed: () {},
                              ),
                              Text(
                                "0",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.plusCircle),
                                onPressed: () {},
                              )
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: FlatBusyButton(
                              isBusy: false, buttonLabel: "BUY TICKETS"))
                    ],
                  ),
                ));
      },
      splashColor: Colors.orange[600],
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF262626).withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: "${slot.start} - ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: '${slot.end}',
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
            ),
            Container(
              child: Text(
                slot.type ?? '2D',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
