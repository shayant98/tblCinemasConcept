import 'package:bltCinemas/ui/views/articles/articles_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ArticlesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticlesViewModel>.reactive(
      builder: (context, model, child) => (model.dataReady)
          ? ListView.separated(
              itemBuilder: (_, index) => Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFF262626),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: CachedNetworkImage(
                              imageUrl: model.data[index].imageUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  model.data[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Colors.orange[600],
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  model.data[index].body,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (_, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: model.data.length)
          : Center(
              child: CircularProgressIndicator(),
            ),
      viewModelBuilder: () => ArticlesViewModel(),
    );
  }
}
