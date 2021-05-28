import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc.dart';
import 'package:the_cat_api_paramonov/pages/bottom_navigation.dart';
import 'package:the_cat_api_paramonov/services/cats_repository.dart';
import 'package:the_cat_api_paramonov/wigets/cats_list_view.dart';

class CatsListPage extends StatelessWidget {
  TabItem _currentTab = TabItem.first;
  final catsRepository = CatsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatBloc>(
      create: (context) => CatBloc(catsRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Cats')),
        ),
        body: Center(
          child: CatsListView(),
        ),
      ),
    );
  }
}
