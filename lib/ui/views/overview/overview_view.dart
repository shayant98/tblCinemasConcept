import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/dumb_widgets/time_slot.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.infoCircle),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    model.showHalfOff ? "On Tuesdays 50% off" : '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
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
        constraints: new BoxConstraints(minHeight: 35.0, maxHeight: 40),
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
                          model.buildDates(index),
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontWeight: index == model.selectedIndex
                                  ? FontWeight.bold
                                  : FontWeight.normal),
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
              Container(
                height: 150,
                child: MovieItemWidget(
                  movie: Movie(
                    id: "bleppppp",
                    title: "the Lion King",
                    desc:
                        "This Disney animated feature follows the adventures of the young lion Simba (Jonathan Taylor Thomas), the heir of his father, Mufasa (James Earl Jones). Simba's wicked uncle, Scar (Jeremy Irons), plots to usurp Mufasa's throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed. Simba returns as an adult (Matthew Broderick) to take back his homeland from Scar with the help of his friends Timon (Nathan Lane) and Pumbaa (Ernie Sabella).",
                    nowShowing: true,
                    comingSoon: false,
                    poster: 'assets/images/lion_king.jpg',
                    categories: ['action', 'kids', 'now showing'],
                  ),
                ),
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
                    Text("2h 15min",
                        style: Theme.of(context).textTheme.caption),
                    Icon(
                      FontAwesomeIcons.accessibleIcon,
                      size: 12,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    LimitedBox(
                      maxHeight: 60,
                      child: ListView.separated(
                        // spacing: 30,
                        // runSpacing: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            TimeSlot(
                                startTime: DateTime.now(),
                                endTime:
                                    DateTime.now().add(Duration(hours: 2))),
                        itemCount: 3,
                        separatorBuilder: (BuildContext context, int index) =>
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
        );
      },
      itemCount: 7,
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}
