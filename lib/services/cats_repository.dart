import 'package:the_cat_api_paramonov/services/cat_api_provider.dart';

class CatsRepository {
  CatsModel _catsProvider = CatsModel();
  Future<List<CatsModel>> getAllCats() => getCatData();
}
