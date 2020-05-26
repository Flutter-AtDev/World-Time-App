import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/ChooseLocation.dart';
import 'package:worldtimeapp/pages/HomePage.dart';
import 'package:worldtimeapp/pages/LoadingScreen.dart';
import 'package:worldtimeapp/utils/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        Home: (context) => HomePage(),
        LOCATION: (context) => ChooseLocation(),
      },
    );
  }
}
