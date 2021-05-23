import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/services/cat_api_provider.dart';

class DetailPage extends StatefulWidget {
  final CatsModel value;

  DetailPage({Key key, this.value}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network('${widget.value.caturl}'),
                  padding: EdgeInsets.only(bottom: 18.0),
                ),
                Text(
                  '${widget.value.catqfact}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
