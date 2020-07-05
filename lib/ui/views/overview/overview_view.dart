import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:bltCinemas/ui/views/overview/overview_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class OverviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OverviewViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "OVERVIEW",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.goBack();
          },
          child: Icon(
            FontAwesomeIcons.check,
            color: Colors.white,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DayList(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: MoviesList(),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => OverviewViewModel(),
    );
  }
}

class DayList extends ViewModelWidget<OverviewViewModel> {
  const DayList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, OverviewViewModel model) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color(0xFF262626),
      ),
      child: ConstrainedBox(
        constraints: new BoxConstraints(minHeight: 35.0, maxHeight: 50),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    model.selectDay(index);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                            (index == model.dayCount - 1) ? 20 : 0),
                        bottomLeft: Radius.circular((index == 0) ? 20 : 0),
                      ),
                      color: index == model.selectedIndex
                          ? Colors.orange[600]
                          : Colors.transparent,
                    ),
                    child: Card(
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: Center(
                        child: Text(
                          "Day $index",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (_, index) => Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      width: 2,
                      height: 10,
                    ),
                    Spacer(),
                    Container(
                      width: 2,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                    ),
                  ],
                ),
            itemCount: model.dayCount),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/lion_king.jpg'),
                width: 80,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "The Lion King",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 30,
                      runSpacing: 10,
                      children: <Widget>[
                        TimeSlot(
                          startTime: '23:00',
                          endTime: '01:15',
                        ),
                        TimeSlot(
                          startTime: '23:00',
                          endTime: '01:15',
                        ),
                        TimeSlot(
                          startTime: '23:00',
                          endTime: '01:15',
                        ),
                        TimeSlot(
                          startTime: '23:00',
                          endTime: '01:15',
                        ),
                        TimeSlot(
                          startTime: '23:00',
                          endTime: '01:15',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 32,
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}

class TimeSlot extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String type;

  const TimeSlot({this.startTime, this.type, this.endTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        child: InkWell(
          onTap: () {},
          splashColor: Colors.orange[600],
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF262626).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Text(
                  "$startTime-$endTime",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Container(
                  child: Text(
                    type ?? '2D',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
