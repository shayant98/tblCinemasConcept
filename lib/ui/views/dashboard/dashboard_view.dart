import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:bltCinemas/ui/dumb_widgets/movies_carousel.dart';
import 'package:bltCinemas/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => ListView(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                dotSize: 4.0,
                dotIncreasedColor: Colors.orange,
                indicatorBgPadding: 5.0,
                dotVerticalPadding: 10,
                dotBgColor: Colors.purple.withOpacity(0),
                autoplayDuration: Duration(seconds: 3),
                images: [
                  CarouselItemWidget(),
                  CarouselItemWidget(),
                  CarouselItemWidget(),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Now showing",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white,
                      ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "View More",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Colors.orange[600],
                          ),
                    ),
                    Icon(
                      FontAwesomeIcons.angleRight,
                      color: Colors.orange[600],
                    ),
                  ],
                )
              ],
            ),
          ),
          MoviesCarousel(movies: model.movies),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Find us",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}

class CarouselItemWidget extends StatelessWidget {
  const CarouselItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Image(
          image: NetworkImage(
              'https://i.pinimg.com/originals/5a/c1/3d/5ac13df15c741c7e8db487e6946de180.png'),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Color(0xFF121212).withOpacity(0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'BLT REOPENING SOON',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.orange[600], fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'SIKE, U THOUGHT',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
