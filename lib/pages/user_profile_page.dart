import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UP'),
      ),
      body: Center(
        child: TextButton(
          child: Text('looogout'),
          onPressed: () {
            _signOut();
          },
        ),
      ),
    );
  }
}
