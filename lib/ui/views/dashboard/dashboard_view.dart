import 'package:bltCinemas/ui/dumb_widgets/movie_item.dart';
import 'package:bltCinemas/ui/dumb_widgets/movies_carousel.dart';
import 'package:bltCinemas/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
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
          OptionsTabWidget(),
          SizedBox(
            height: 20,
          ),
          MoviesCarousel(
            movies: 3,
          )
        ],
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}

class OptionsTabWidget extends StatelessWidget {
  const OptionsTabWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Color(0xFF262626).withOpacity(0.6),
            borderRadius: BorderRadius.circular(40)),
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Ink(
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                splashColor: Colors.orange,
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text("NOW SHOWING",
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Colors.orange[600],
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            VerticalDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: Text("COMING SOON",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
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
