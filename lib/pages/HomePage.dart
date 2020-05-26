import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimeapp/utils/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Variables
Map data = {};

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data.toString());
    String bgImage = data[isDAYTIME] ? 'day.png' : 'night.png';
    Color bgColor = data[isDAYTIME] ? Colors.blue : Colors.indigo[700];
    //
    return Scaffold(
      backgroundColor: bgColor,
//      appBar: AppBar(
//        title: Text('TimeApp'),
//        backgroundColor: Colors.red,
//        centerTitle: true,
//        elevation: 0.6,
//      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              //SizedBox(height: 10),
              Center(
                child: FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, LOCATION);
                    },
                    icon: Icon(Icons.edit_location),
                    color: Colors.red,
                    textColor: Colors.white,
                    label: Text('Edit Location')),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data[LOCATION],
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2.0, color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                data[TIME],
                style: TextStyle(
                    fontSize: 60,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
              )
            ],
          )),
        ),
      ),
    );
  }
}
