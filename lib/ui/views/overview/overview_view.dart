import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/smart_widgets/time_slot/time_slot_view.dart';
import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:bltCinemas/ui/views/overview/overview_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                child: model.dataReady && !model.isBusy
                    ? MoviesList()
                    : Center(
                        child: FutureBuilder(
                            future: Future.delayed(Duration(seconds: 3)),
                            builder: (_, snapshot) =>
                                snapshot.connectionState == ConnectionState.done
                                    ? Text("No movies found")
                                    : CircularProgressIndicator())),
              ),
            ],
          )),
      viewModelBuilder: () => OverviewViewModel(),
      onModelReady: (model) => model.initialise(),
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

class MoviesList extends ViewModelWidget<OverviewViewModel> {
  @override
  Widget build(BuildContext context, OverviewViewModel model) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int movieIndex) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: MovieItemWidget(movie: model.data[movieIndex].movie)),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.data[movieIndex].movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "${model.data[movieIndex].movie.duration} minutes" ??
                            '',
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
                        itemBuilder: (BuildContext context, int slotIndex) =>
                            TimeSlotWidget(
                                slot: model.data[movieIndex].slots[slotIndex],
                                movie: model.data[movieIndex].movie,
                                currentDate: model.selectedDate),
                        itemCount: model.data[movieIndex].slots.length,
                        separatorBuilder:
                            (BuildContext context, int slotIndex) => SizedBox(
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
      itemCount: model.data.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}
