import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/model/bottom_menu_items_model.dart';
import 'package:bltCinemas/ui/views/dashboard/dashboard_view.dart';
import 'package:bltCinemas/ui/views/films/films_view.dart';
import 'package:bltCinemas/ui/views/ticket/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  List<BottomMenuItemModel> _menuItems = [
    BottomMenuItemModel(
      icon: Icon(FontAwesomeIcons.home),
      title: 'Home',
      view: DashboardView(),
    ),
    BottomMenuItemModel(
      icon: Icon(FontAwesomeIcons.film),
      title: 'Films',
      view: FilmsView(),
    ),
    BottomMenuItemModel(
      icon: Icon(FontAwesomeIcons.ticketAlt),
      title: 'Tickets',
      view: TicketView(),
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

  void navigateToOverview() async {
    await _navigationService.navigateTo(Routes.overviewViewRoute);
  }
}
