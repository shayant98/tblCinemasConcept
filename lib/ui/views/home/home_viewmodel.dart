import 'package:bltCinemas/model/bottom_menu_items_model.dart';
import 'package:bltCinemas/ui/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<BottomMenuItemModel> _menuItems = [
    BottomMenuItemModel(
      icon: Icon(FontAwesomeIcons.home),
      title: 'Home',
      view: DashboardView(),
    ),
    BottomMenuItemModel(
      icon: Icon(FontAwesomeIcons.film),
      title: 'Films',
      view: DashboardView(),
    ),
    BottomMenuItemModel(
      icon: Icon(FontAwesomeIcons.ticketAlt),
      title: 'Tickets',
      view: DashboardView(),
    ),
    BottomMenuItemModel(
      icon: Icon(FontAwesomeIcons.user),
      title: 'Profile',
      view: DashboardView(),
    ),
  ];

  List<BottomMenuItemModel> get menuItems => _menuItems;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  selectMenuItem(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
