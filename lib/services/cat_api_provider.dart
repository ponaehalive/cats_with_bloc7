import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class CatsModel {
  final String caturl;
  final String catfact;

  CatsModel({this.caturl, this.catfact});

  factory CatsModel.fromJson(Map<String, dynamic> jsonData) {
    return CatsModel(caturl: jsonData['url'], catfact: jsonData['fact']);
  }
}

Future<List<CatsModel>> getCatData() async {
  var imagesUri = Uri.parse(
      'https://api.thecatapi.com/v1/images/search?limit=10&page=1&order=Desc');
  var factsUri = Uri.parse('https://catfact.ninja/facts?limit=10');

  var imagesResponse = await http.get(imagesUri);
  var factsResponse = await http.get(factsUri);

  if (imagesResponse.statusCode == 200 && factsResponse.statusCode == 200) {
    List images = json.decode(imagesResponse.body);
    List facts = json.decode(factsResponse.body)['data'];

    List<CatsModel> cats = [];
    for (int i = 0; i < images.length; i++) {
      cats.add(CatsModel(caturl: images[i]['url'], catfact: facts[i]['fact']));
    }
    return cats;
  } else
    throw Exception('Json data download error');
}
