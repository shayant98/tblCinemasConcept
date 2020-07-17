import 'package:bltCinemas/model/movie_model.dart';
import 'package:bltCinemas/ui/dumb_widgets/flat_busy_button.dart';
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
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 200,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RichText(
                          text: TextSpan(text: "Seats Available: ", children: [
                            TextSpan(
                                text: "${model.data.seats}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontWeight: FontWeight.bold))
                          ]),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "ADULT",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
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
                                    onPressed: () =>
                                        model.subtractToOption('adult')),
                                Text(
                                  "${model.adultCounter}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(color: Colors.white),
                                ),
                                IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plusCircle,
                                      color: Colors.orange[600],
                                    ),
                                    onPressed: () => model.addToOption('adult'))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "KIDS",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
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
                                    onPressed: () =>
                                        model.subtractToOption('kids')),
                                Text(
                                  "${model.kidsCounter}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(color: Colors.white),
                                ),
                                IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plusCircle,
                                      color: Colors.orange[600],
                                    ),
                                    onPressed: () => model.addToOption('kids'))
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatBusyButton(
                            isBusy: model.isBusy,
                            buttonLabel: "CONFIRM PURCHASE",
                            onpressed: model.buyTicket,
                          ),
                        )
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
