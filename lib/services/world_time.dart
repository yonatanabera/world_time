import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String? location; //Location name for the UI
  String? time; //The time in that location
  String? flag; //URL to an asset flag
  String urls=''; //Location url forapi end point
  bool? isDayTime; //True or False

  WorldTime (String location, String flag, String url){
    this.location = location;
    this.flag = flag;
    this.urls = url;
  }

  Future<void> getTime() async{
    try{
      var url= Uri.https('worldtimeapi.org','/api/timezone/$urls');
      http.Response response = await http.get(url);
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset= data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);
      // print(url);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      isDayTime = now.hour > 10 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(e){
      print('caught error: $e');
      time = "Couldn't get time data";
    }
  }

}