import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimeapp/utils/Constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimeApp'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0.6,
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Center(
            child: FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, LOCATION);
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location')),
          )
        ],
      )),
    );
  }
}
