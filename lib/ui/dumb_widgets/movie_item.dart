import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key key,
  }) : super(key: key);
// https://images.wallpapersden.com/image/download/bloodshot-movie-4k-poster_68757_6072x9000.jpg
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.orange[600],
        child: Container(
            margin: EdgeInsets.only(),
            color: Color(0xFF262626),
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Image(
                        width: MediaQuery.of(context).size.width * 0.40,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.wallpapersden.com/image/download/bloodshot-movie-4k-poster_68757_6072x9000.jpg'))),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    "TITLE",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.orange[600]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, left: 8),
                  child: Text(
                    "SUBTITLE",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
