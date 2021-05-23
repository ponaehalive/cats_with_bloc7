import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc_event.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc_state.dart';
import 'package:the_cat_api_paramonov/pages/detail_page.dart';
import 'package:the_cat_api_paramonov/services/cat_api_provider.dart';

class CatsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CatBloc userBloc = BlocProvider.of<CatBloc>(context);

    return BlocBuilder<CatBloc, CatBlocState>(
      builder: (context, state) {
        if (state is CatBlocEmptyState) {
          userBloc.add(CatBlocLoadEvent());
          return Center(
            child: Text('empty'),
          );
        }
        if (state is CatBlocLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CatBlocLoadedState) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.loadedCat.length,
              itemBuilder: (context, int currentIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      trailing: Icon(Icons.favorite_border),
                      title: Card(
                        elevation: 5.0,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                child: Image.network(
                                    state.loadedCat[currentIndex].caturl),
                                padding: EdgeInsets.only(bottom: 8.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        var route = MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DetailPage(value: state.loadedCat[currentIndex]),
                        );

                        Navigator.of(context).push(route);
                      }),
                );
              });
        }

        return Text('some');
      },
    );
  }
}
