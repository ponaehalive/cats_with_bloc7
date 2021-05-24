import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/pages/landing_page.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';
import 'package:the_cat_api_paramonov/services/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Flutter Login UI',
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
