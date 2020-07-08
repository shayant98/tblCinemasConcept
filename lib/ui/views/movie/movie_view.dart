import 'dart:ui';

import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:bltCinemas/ui/views/movie/movie_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            FontAwesomeIcons.shoppingBag,
            color: Colors.white,
          ),
          onPressed: () {
            model.navigateToTicketsView();
          },
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[MovieImage(), AppBarControls(), MovieTitle()],
            ),
            SizedBox(
              height: 20,
            ),
            MovieInfo(),
            SizedBox(
              height: 20,
            ),
            Description(),
            SizedBox(
              height: 20,
            ),
            Actors(),
            SizedBox(
              height: 20,
            ),
            Trailers(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MovieViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}

class MovieInfo extends ViewModelWidget<MovieViewModel> {
  const MovieInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, MovieViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: MovieItemWidget(movie: model.currentMovie),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  model.toggleTitle();
                },
                child: LimitedBox(
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    model.currentMovie.title,
                    maxLines: model.showFullTitle ? null : 5,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Divider(),
              Text(
                "123 minutes",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.accessibleIcon,
                    size: 12,
                  ),
                  Icon(
                    FontAwesomeIcons.accessibleIcon,
                    size: 12,
                  ),
                  Icon(
                    FontAwesomeIcons.accessibleIcon,
                    size: 12,
                  ),
                ],
              ),
              Divider(),
            ],
          )
        ],
      ),
    );
  }
}

class Actors extends StatelessWidget {
  const Actors({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Actors",
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          LimitedBox(
            maxHeight: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: CircleAvatar(
                        minRadius: 35,
                        maxRadius: 45,
                        backgroundImage:
                            AssetImage('assets/images/the_ultimate_actor.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Jennifer \n Aniston $index",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Colors.orange[600],
                          ),
                    ),
                  ],
                );
              },
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Trailers extends ViewModelWidget<MovieViewModel> {
  const Trailers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, MovieViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Trailers",
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.20,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 250,
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/lion_king.jpg'))),
                  ),
                );
              },
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends ViewModelWidget<MovieViewModel> {
  const Description({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, MovieViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Description",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                    ),
              ),
              GestureDetector(
                onTap: () {
                  model.toggleDesc();
                },
                child: Text(
                  (model.showFullDesc) ? "Read less" : "Read more",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Colors.orange[600],
                      ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              model.toggleDesc();
            },
            child: AnimatedCrossFade(
              firstChild: Text(
                model.currentMovie.desc,
                maxLines: 6,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                    ),
              ),
              secondChild: Text(
                model.currentMovie.desc,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                    ),
              ),
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeOutExpo,
              crossFadeState: (model.showFullDesc)
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 200),
            ),
          )
        ],
      ),
    );
  }
}

class AppBarControls extends ViewModelWidget<MovieViewModel> {
  const AppBarControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, MovieViewModel model) {
    return Positioned(
      top: 0,
      width: MediaQuery.of(context).size.width,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.heart), onPressed: () {})
        ],
      ),
    );
  }
}

class MovieImage extends ViewModelWidget<MovieViewModel> {
  const MovieImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, MovieViewModel model) {
    return Hero(
      tag: model.currentMovie.id,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(model.currentMovie.poster)),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
        ),
      ),
    );
  }
}

class MovieTitle extends ViewModelWidget<MovieViewModel> {
  const MovieTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, MovieViewModel model) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF121212),
              Colors.transparent,
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
        ),
        child: Text(
          model.currentMovie.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline3.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
