import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:worldtimeapp/utils/Constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

String time = 'Loading..';

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: SpinKitRotatingCircle(
          //https://pub.dev/packages/flutter_spinkit //SpinKitWanderingCubes
          color: Colors.white,
          size: 50,
        )),
      ),
    );
  }

  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    //navigate Home Screen
    Navigator.pushReplacementNamed(context, Home, arguments: {
      LOCATION: worldTime.location,
      TIME: worldTime.time,
      FLAG: worldTime.flag,
      isDAYTIME: worldTime.isDayTime,
    });
    print(worldTime.time);
//    setState(() {
//      time = worldTime.time;
//    });
  }
}
