import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:worldtimeapp/utils/Constants.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {

  void goToLocation(int index) async {
    WorldTime location = locations[index];
    await location.getTime();
    print('mylocation:: ${location.time}');
    //Navigate to Home Screen //pop = back to last Route
    Navigator.pop(context, {
      LOCATION: location.location,
      TIME: location.time,
      FLAG: location.flag,
      isDAYTIME: location.isDayTime,
    });
  }

  int counter = 0;
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState called');
    print('test::  assets/${locations[0].flag}');
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
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200]
        ),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Card(
                  child: ListTile(
                      onTap: () {
                        goToLocation(index);
                      },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                      )),
                ),
              );
            }),
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.plus_one),
//        onPressed: () {
//          setState(() {
//            plusCounter();
//          });
//        },
//      ),
    );
  }

  plusCounter() {
    counter++;
  }


}
