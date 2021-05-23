import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 150,
                    width: 150,
                    image: AssetImage('images/cat_login.png'),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CAT LOGIN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _signInWithFacebook,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('images/fb_cat.png'),
                    ),
                  ),
                  SizedBox(width: 50),
                  FloatingActionButton(
                    onPressed: _signInWithGoogle,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('images/google_cat.png'),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: _signInAnonymously,
                child: Text('anonymous'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// AssetImage('images/cat_login.png')
