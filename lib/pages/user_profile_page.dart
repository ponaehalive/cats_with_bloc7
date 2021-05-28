import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';
import 'package:the_cat_api_paramonov/wigets/avatar.dart';
import 'package:the_cat_api_paramonov/wigets/show_alert_dialog.dart';

class UserProfile extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(context,
        title: 'Logout',
        content: 'Are you sure?',
        cancelActionText: 'Cancel',
        defaultActionText: 'Logout');
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildUserInfo(auth.currentUser),
            SizedBox(height: 20.0),
            TextButton(
              child: Text(
                'LogOut',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () => _confirmSignOut(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: [
        Avatar(
          photoUrl: user.photoURL,
          radius: 70,
        ),
        SizedBox(height: 20),
        if (user.displayName != null) Text(user.displayName),
        SizedBox(height: 20),
        if (user.email != null) Text(user.email)
      ],
    );
  }
}
