import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cat_api_paramonov/bloc/login_bloc.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';
import 'package:the_cat_api_paramonov/wigets/show_exception_alert_dialog.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key, @required this.bloc}) : super(key: key);
  final LogInBloc bloc;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<LogInBloc>(
      create: (_) => LogInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<LogInBloc>(
        //alternative way to access Provider
        builder: (_, bloc, __) => LoginPage(bloc: bloc),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await bloc.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await bloc.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await bloc.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // debugShowCheckedModeBanner: false,
      appBar: AppBar(
        title: Center(child: Text('Cat Facts')),
      ),

      body: StreamBuilder<bool>(
          stream: bloc.isLoadingStream,
          initialData: false,
          builder: (context, snapshot) {
            return _buildContent(context, snapshot.data);
          }),
    );
  }

  Widget _buildContent(BuildContext context, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(16.0),
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
              _buildHeader(isLoading),
            ],
          ),
          SizedBox(height: 80.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed:
                    isLoading ? null : () => _signInWithFacebook(context),
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage('images/fb_cat.png'),
                ),
              ),
              SizedBox(width: 50),
              FloatingActionButton(
                onPressed: isLoading ? null : () => _signInWithGoogle(context),
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage('images/google_cat.png'),
                ),
              )
            ],
          ),
          TextButton(
            onPressed: isLoading ? null : () => _signInAnonymously(context),
            child: Text('anonymous'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'CAT LOGIN',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}

//
// AssetImage('images/cat_login.png')
