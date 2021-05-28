import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc_event.dart';
import 'package:the_cat_api_paramonov/bloc/cat_bloc_state.dart';
import 'package:the_cat_api_paramonov/services/cat_api_provider.dart';
import 'package:the_cat_api_paramonov/services/cats_repository.dart';

class CatBloc extends Bloc<CatBlocEvent, CatBlocState> {
  final CatsRepository catsRepository;
  CatBloc(this.catsRepository) : super(CatBlocEmptyState());

  @override
  Stream<CatBlocState> mapEventToState(CatBlocEvent event) async* {
    if (event is CatBlocLoadEvent) {
      yield CatBlocLoadingState();

      try {
        final List<CatsModel> _loadedCatList =
            await catsRepository.getAllCats();
        yield CatBlocLoadedState(loadedCat: _loadedCatList);
      } catch (_) {
        yield CatBlocEmptyState();
      }
    }
    // else if (event is UpdateFavoriteCatsEvent) yield* _updateFavoritesCats(event);
  }
}
