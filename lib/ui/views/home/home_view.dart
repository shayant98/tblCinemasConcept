import 'package:bltCinemas/model/bottom_menu_items_model.dart';
import 'package:bltCinemas/ui/views/home/home_viewmodel.dart';
import 'package:carousel_pro/carousel_pro.dart';
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
            child: Image(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/5a/c1/3d/5ac13df15c741c7e8db487e6946de180.png')),
          ),
          title: Text(
            model.menuItems[model.selectedIndex].title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.cog),
              onPressed: () {},
              iconSize: 18,
            )
          ],
        ),
        body: model.menuItems[model.selectedIndex].view,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.calendar_today),
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
