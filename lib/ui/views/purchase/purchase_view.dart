import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/dumb_widgets/flat_busy_button.dart';
import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:bltCinemas/ui/views/purchase/purchase_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class PurchaseView extends StatelessWidget {
  final String id;
  final Movie movie;

  const PurchaseView({Key key, this.id, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PurchaseViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("PURCHASE"),
          ),
          body: model.dataReady
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MovieItemWidget(movie: movie),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    movie.title,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Seats Available: ",
                                      children: [
                                        TextSpan(
                                          text: "${model.data.seats}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Divider(),
                        TicketOption(
                          optionIdentifier: "adult",
                          counter: model.adultCounter,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if (movie.adult == false)
                          TicketOption(
                            optionIdentifier: "kids",
                            counter: model.kidsCounter,
                          ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatBusyButton(
                            isBusy: model.isBusy,
                            buttonLabel: "CONFIRM PURCHASE",
                            onpressed: model.buyTicket,
                          ),
                        ),
                        SizedBox(height: 20),
                        CostBreakdown(movie: movie),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      viewModelBuilder: () => PurchaseViewModel(id: id, movie: movie),
      onModelReady: (model) => model.init(),
    );
  }
}

class TicketOption extends ViewModelWidget<PurchaseViewModel> {
  final String optionIdentifier;
  final int counter;

  TicketOption({this.counter, this.optionIdentifier});

  @override
  Widget build(BuildContext context, PurchaseViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          optionIdentifier.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.white),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.minusCircle,
                  color: Colors.orange[600],
                ),
                onPressed: () => model.subtractToOption(optionIdentifier)),
            Text(
              "${counter}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.plusCircle,
                  color: Colors.orange[600],
                ),
                onPressed: () => model.addToOption(optionIdentifier))
          ],
        )
      ],
    );
  }
}

class CostBreakdown extends ViewModelWidget<PurchaseViewModel> {
  const CostBreakdown({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context, PurchaseViewModel model) {
    return ExpansionTile(
      title: Text(
        "Cost Breakdown",
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Credits:"),
                  Text("${model.userCredits}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ticket Costs:"),
                  Column(
                    children: <Widget>[
                      Text(
                        "Adults: ${model.adultCounter} x",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      if (movie.adult == false)
                        Text(
                          "Kids: ${model.kidsCounter} x",
                          style: Theme.of(context).textTheme.caption,
                        ),
                    ],
                  ),
                  Text("${model.totalCost}"),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 100,
                  child: Divider(
                    color: Colors.orange[600],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Remaining Credit:",
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.orange[600], fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${model.remainingCredit}",
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
