import 'package:bltCinemas/model/bottom_menu_items_model.dart';
import 'package:bltCinemas/ui/dumb_widgets/appbar_search.dart';
import 'package:bltCinemas/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(image: AssetImage("assets/images/tbl.png"))),
          title: Text(
            model.menuItems[model.selectedIndex].title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                showSearch(context: context, delegate: AppbarSearch());
              },
              iconSize: 18,
            )
          ],
        ),
        body: model.menuItems[model.selectedIndex].view,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.navigateToOverview();
          },
          child: Icon(
            FontAwesomeIcons.calendar,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class BottomNavigation extends ViewModelWidget<HomeViewModel> {
  const BottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return BottomAppBar(
      child: BottomNavigationBar(
        currentIndex: model.selectedIndex,
        onTap: (index) => model.selectMenuItem(index),
        items: [
          for (BottomMenuItemModel item in model.menuItems)
            BottomNavigationBarItem(icon: item.icon, title: Text(item.title))
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF121212),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.orange[600],
        iconSize: 18,
      ),
    );
  }
}

class OverviewSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
