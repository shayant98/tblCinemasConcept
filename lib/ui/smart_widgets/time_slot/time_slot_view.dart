import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/model/time_slot_model.dart';
import 'package:bltCinemas/ui/smart_widgets/time_slot/time_slot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class TimeSlotWidget extends StatelessWidget {
  final TimeSlot slot;
  final DateTime currentDate;
  final Movie movie;

  const TimeSlotWidget({this.slot, this.currentDate, this.movie});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TimeSlotWidgetViewModel>.reactive(
      builder: (context, model, child) => InkWell(
        onLongPress: () {
          showModalBottomSheet(context: context, builder: (_) => Container());
        },
        onTap: () {
          model.navigateToPurchaseScreen(slot.id, movie);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      slot.type ?? '2D',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => TimeSlotWidgetViewModel(),
    );
  }
}
