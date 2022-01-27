import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_new/page/verify_email_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return VerifyEmailPage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something Went Wrong'),
            );
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
