import 'package:flutter/material.dart';

enum TabItem { first, favorites, profile }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});
  final String title;
  final IconData icon;
  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.first: TabItemData(title: 'Cats', icon: Icons.visibility_outlined),
    TabItem.favorites: TabItemData(title: 'Favorites', icon: Icons.favorite),
    TabItem.profile: TabItemData(title: 'Profile', icon: Icons.person),
  };
}
