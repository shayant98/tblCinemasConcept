import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/dumb_widgets/time_slot.dart';
import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:bltCinemas/ui/views/screen_times/screen_times_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class ScreenTimesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScreenTimesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("SHOWINGS"),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.filter),
              iconSize: 20,
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "20 jun 2002",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  LimitedBox(
                                    maxHeight: 60,
                                    child: ListView.separated(
                                      // spacing: 30,
                                      // runSpacing: 10,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              TimeSlot(
                                        startTime: DateTime.now()
                                            .subtract(Duration(hours: 2)),
                                        endTime: DateTime.now()
                                            .add(Duration(hours: 3)),
                                      ),
                                      itemCount: 3,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(
                                        width: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 20,
                      )),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => ScreenTimesViewModel(),
    );
  }
}
