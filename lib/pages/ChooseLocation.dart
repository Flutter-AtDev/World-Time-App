import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}
int counter = 0;

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState called');
  }
  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      appBar: AppBar(
        title: Text('choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: Text('counter is $counter'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          setState((){plusCounter();});
        },
      ),
    );
  }


  plusCounter() {
    counter++;
  }
}
