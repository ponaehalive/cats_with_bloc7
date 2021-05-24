import 'package:flutter/material.dart';

enum TabItem { first, favorites, profile }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});
  final String title;
  final IconData icon;
  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.first: TabItemData(title: 'first', icon: Icons.article),
    TabItem.favorites: TabItemData(title: 'favorites', icon: Icons.favorite),
    TabItem.profile: TabItemData(title: 'profile', icon: Icons.person),
  };
}
