import 'package:bltCinemas/ui/smart_widgets/category_button/category_button_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class CategoryButtonView extends StatelessWidget {
  final String categoryName;

  const CategoryButtonView({Key key, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryButtonViewModel>.nonReactive(
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          model.navigateToCategoryView(categoryName);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                categoryName,
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
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => CategoryButtonViewModel(),
    );
  }
}
