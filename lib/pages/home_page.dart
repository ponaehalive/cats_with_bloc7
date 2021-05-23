import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc_event.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';
import 'package:the_cat_api_paramonov/services/cat_api_provider.dart';
import 'package:the_cat_api_paramonov/services/cats_repository.dart';
import 'package:the_cat_api_paramonov/wigets/cats_list_view.dart';

class HomePage extends StatelessWidget {
  final catsRepository = CatsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatBloc>(
      create: (context) => CatBloc(catsRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: CatsListView(),
        ),
      ),
    );
  }
}
