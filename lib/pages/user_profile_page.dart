import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/services/auth_provider.dart';

class UserProfile extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('looogout'),
          onPressed: () {
            _signOut(context);
          },
        ),
      ),
    );
  }
}
