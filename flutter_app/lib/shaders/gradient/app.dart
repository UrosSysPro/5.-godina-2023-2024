import 'dart:ui';

import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late FragmentProgram shader;
  late Future<bool> loader;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loader=init();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // shader.fragmentShader().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple
        )
      ),
      home: Scaffold(
        body: FutureBuilder(
          future: loader,
          builder: (context,snapshot) {
            if(snapshot.hasData) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.deepPurple,
                child: CustomPaint(
                  painter: ShaderPainter(shader),
                ),
              );
            }
            else{
              return Center(
                child: Text("Loading",style: TextStyle(fontSize: 30),),
              );
            }
          }
        ),
      ),
    );
  }

  Future<bool> init()async{
    try{
      shader = await FragmentProgram.fromAsset('shaders/gradient.frag');
    }catch(e){
      print(e);
    }
    return true;
  }
}


class ShaderPainter extends CustomPainter{
  FragmentProgram shader;

  ShaderPainter(this.shader);

  @override
  void paint(Canvas canvas, Size size) {
    var fragment=shader.fragmentShader();
    fragment.setFloat(0, 1.0);
    fragment.setFloat(1, .0);
    fragment.setFloat(2, .0);
    fragment.setFloat(3, 1);
    fragment.setFloat(4, size.width);
    fragment.setFloat(5, size.height);
    var rect=Rect.fromLTWH(0,0,size.width,size.height);
    var paint=Paint()
    ..color=Colors.green
    ..shader=fragment
    ;

    canvas.drawRect(rect,paint);
  }

  @override
  bool shouldRepaint(ShaderPainter oldDelegate) {
    return true;
  }
}