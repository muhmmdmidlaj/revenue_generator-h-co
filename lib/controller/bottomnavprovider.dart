import 'package:flutter/material.dart';
import 'package:revenue_generator/model/bottom_navitem.dart';


class BottomNavBarProvider extends ChangeNotifier {
  BottomNavItem _currentItem = BottomNavItem.total;

  BottomNavItem get currentItem => _currentItem;

  void setCurrentItem(BottomNavItem item) {
    _currentItem = item;
    notifyListeners();
  }
}