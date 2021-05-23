import 'package:flutter/cupertino.dart';

abstract class CatBlocState {}

class CatBlocEmptyState extends CatBlocState {}

class CatBlocLoadingState extends CatBlocState {}

class CatBlocLoadedState extends CatBlocState {
  List<dynamic> loadedCat;
  CatBlocLoadedState({@required this.loadedCat}) : assert(loadedCat != null);
}

class UserErrorState extends CatBlocState {}
