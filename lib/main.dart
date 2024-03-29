import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'alcohol/HomePage.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((x) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LiquorAdvisor',
        theme: ThemeData(
            primarySwatch: Colors.lime,
            accentColor: Colors.lime,
            brightness: Brightness.dark,
            canvasColor: Colors.transparent),
        home: Container(child: HomePage()));
  }
}
