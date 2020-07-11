import 'package:bltCinemas/ui/smart_widgets/movies_item/movie_item_view.dart';
import 'package:bltCinemas/ui/views/category/category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.currentCategory),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            if (model.dataReady)
              (model.data.length > 0)
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (_, index) => Container(
                            child: Column(
                          children: <Widget>[
                            Container(
                              height: 150,
                              child: MovieItemWidget(
                                movie: model.data[index],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              model.data[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              model.data[index].comingSoonDate ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: Colors.orange[600]),
                            ),
                          ],
                        )),
                        itemCount: model.data.length,
                      ),
                    )
                  : Center(
                      child: Text('No movies found'),
                    ),
          ],
        ),
      ),
      viewModelBuilder: () => CategoryViewModel(),
      onModelReady: (model) => model.init(),
    );
  }
}
