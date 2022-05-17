import 'package:flutter/material.dart';
import 'package:location/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance = WorldTime('Seoul', 'south_korea.png', 'Asia/Seoul');
    await instance.getTime();
    // print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitSpinningLines (
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}
