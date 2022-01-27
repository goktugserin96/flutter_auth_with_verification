import 'package:firebase_auth_new/page/home_page.dart';
import 'package:firebase_auth_new/provider/email_sign_in.dart';
import 'package:firebase_auth_new/provider/google_sign_in.dart';
import 'package:firebase_auth_new/util/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/contstants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: Utils.scaffoldMessengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: title,
        theme: themeLogin,
        home: MyHomePage(),
      ),
    );
  }
}
