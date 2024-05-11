import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/snake/snake.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin{
  int width=7,height=23;
  Snake snake=Snake();
  Random random=Random();
  late SnakePart food;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    food=SnakePart(random.nextInt(width),random.nextInt(height));
    snake.init(width, height);
    snake.add(n:5);
    controller=AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 100),
    );
    controller.addStatusListener((status) {
      setState(() {
        if(status==AnimationStatus.completed) {
          snake.update(width, height);
          var head=snake.parts.first;
          if(food.x==head.x&&food.y==head.y){
            food.x=random.nextInt(width);
            food.y=random.nextInt(height);
            snake.add();
          }
          controller.value = 0;
          controller.forward();
        }
      });
    });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark
        ),
      ),
      title: "Snake",
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Row(
                children: List.generate(width, (i) => Expanded(
                  child: Column(
                    children: List.generate(height, (j) =>
                        Expanded(
                            child: Center(
                              child: SizedBox(
                                height: 30,
                                  child: Switch(
                                      value: snake.parts.where((part) => part.x==i&&part.y==j).isNotEmpty || (food.x==i&&food.y==j),
                                      activeColor: food.x==i&&food.y==j?Colors.deepOrange:null,
                                      onChanged: (value){}
                                  )
                              ),
                            )
                        )
                    ),
                  ),
                )),
              ),
              GestureDetector(
                onHorizontalDragUpdate: (value){
                  snake.vy=0;
                  if(value.delta.dx>0)snake.vx=1;
                  if(value.delta.dx<0)snake.vx=-1;
                },
                onVerticalDragUpdate: (value){
                  snake.vx=0;
                  if(value.delta.dy>0) {
                    snake.vy=1;
                  } else {
                    snake.vy=-1;
                  }
                },
                child: SizedBox(width: double.infinity,height: double.infinity,child: Container(color: Colors.white.withAlpha(10)),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
