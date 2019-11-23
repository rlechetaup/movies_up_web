import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_up_web/alerts.dart';
import 'package:movies_up_web/pages/movies_page.dart';
import 'package:movies_up_web/pages/send_push_page.dart';

import 'firebase.dart';
import 'movie.dart';

void main() {
  initFirebase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SendPushPage(),
    );
  }
}

