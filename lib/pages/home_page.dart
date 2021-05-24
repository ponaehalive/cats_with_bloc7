import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/pages/bottom_navigation.dart';
import 'package:the_cat_api_paramonov/pages/cats_list_page.dart';
import 'package:the_cat_api_paramonov/wigets/cupertino_home_scaffold.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';

import 'user_profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.first;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.first: (_) => CatsListPage(),
      TabItem.favorites: (_) => Container(),
      TabItem.profile: (_) => UserProfile(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
