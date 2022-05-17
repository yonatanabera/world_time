import 'package:flutter/material.dart';
import 'package:location/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('London', 'uk.png', 'Europe/London'),
    WorldTime('Athens','greece.png', 'Europe/Berlin'),
    WorldTime('Cairo', 'egypt.png', 'Africa/Cairo'),
    WorldTime('Nairobi', 'kenya.png', 'Africa/Nairobi'),
    WorldTime('Chicago', 'usa.png', 'America/Chicago'),
    WorldTime('New York', 'usa.png', 'America/New_York'),
    WorldTime('Seoul','south_korea.png', 'Asia/Seoul'),
    WorldTime('Jakarta','indonesia.png', 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //When using pop method, you don't pass arguments{}, you directly send the data in a map
    // print(instance.location);
    // print(instance.flag);
    // print(instance.time);
    // print(instance.isDayTime);

    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('Build State');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].urls),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                )
              ),
            );
          },
      )
    );
  }
}


