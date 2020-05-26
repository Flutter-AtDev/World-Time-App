import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location Name for the UI
  String time; //the Time in That Location
  String flag; // url to asset flag icon
  String url; //location url for api endPoint
  bool isDayTime; //true or false of daytime

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      if (response.statusCode == 200) {
      } else {}
      print(data['datetime']);
      String offset = data['dst_offset'].toString().substring(1, 3);
      print(offset);
      DateTime now = DateTime.parse(data['datetime']);
      print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);

      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('error CAUGHT : $e');
      time = 'couldnt get Time';
    }
  }
}
