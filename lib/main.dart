// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:cric_api/pages/auth_user/register.dart';
import 'package:cric_api/pages/auth_user/siginin.dart';
import 'package:cric_api/pages/auth_user/user_ui.dart';
import 'package:cric_api/pages/multiplematch/current_match.dart';
import 'package:cric_api/pages/multiplematch/navigator.dart';
import 'package:cric_api/pages/multiplematch/series.dart';
import 'package:cric_api/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/series': (context) => HomePage(),
        '/current': (context) => Match(),
        '/spl': (context) => Splash(),
        '/home': (context) => Home(),
        '/uregister': (context) => RegP(),
        '/auth': (context) => Register(),
        '/usign': (context) => logIn()
      },
      home: Splash(),
    );
  }
}
