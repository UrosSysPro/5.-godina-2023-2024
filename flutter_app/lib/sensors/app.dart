import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrangeAccent,
          brightness: Brightness.dark
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),
          title: Text("AppBar"),
          actions: [],
        ),
        body: Center(
          child: Column(
            children: [
              StreamBuilder(
                stream: accelerometerEventStream(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Text(
                      'x: ${snapshot.data?.x.toStringAsFixed(3)}'
                          'y:${snapshot.data?.y.toStringAsFixed(3)}'
                          'z:${snapshot.data?.z.toStringAsFixed(3)}'
                    );
                  }else{
                    return Text("no accelerometer data");
                  }
                },
              ),
              StreamBuilder(
                stream: gyroscopeEventStream(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    var d=snapshot.data!;
                    return Text(
                      'x: ${d.x.toStringAsFixed(3)}'
                      'y: ${d.y.toStringAsFixed(3)}'
                      'z: ${d.z.toStringAsFixed(3)}'
                    );
                  }else{
                    return Text('no gyroscope data');
                  }
                },
              ),
              StreamBuilder(
                stream: magnetometerEventStream(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    var d=snapshot.data!;
                    return Text(
                        'x: ${d.x.toStringAsFixed(3)}'
                            'y: ${d.y.toStringAsFixed(3)}'
                            'z: ${d.z.toStringAsFixed(3)}'
                    );
                  }else{
                    return Text('no magnetometer data');
                  }
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
