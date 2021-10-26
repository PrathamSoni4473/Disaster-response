import './screens/disaster_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
                bodyText2: const TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                ),
                headline1: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                headline2: const TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(36, 36, 36, 1),
                  fontWeight: FontWeight.bold,
                ),
              )),
      home: DisasterHome(),
    );
  }
}
