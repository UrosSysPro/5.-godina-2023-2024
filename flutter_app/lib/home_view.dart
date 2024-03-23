import 'package:flutter/material.dart';
import 'package:flutter_app/post.dart';
import 'package:flutter_app/stories.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logo"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.heart_broken),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.chat),
          )
        ],
      ),
      body: ListView(
        children: [
          Stories(),
          ...List.generate(10, (index) => Post()).toList()
        ],
      ),
    );
  }
}
