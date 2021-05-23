import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/pages/user_profile_page.dart';
import 'package:the_cat_api_paramonov/pages/home_page.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';

import 'login_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            //sign in check in
            return LoginScreen(
              auth: auth,
            );
          }
          return UserProfile();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
