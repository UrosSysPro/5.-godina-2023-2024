import 'package:flutter/material.dart';
import 'package:flutter_app/instagram/post.dart';
import 'package:flutter_app/instagram/stories.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logo"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.heart_broken),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.chat),
          )
        ],
      ),
      body: ListView(
        children: [
          const Stories(),
          ...List.generate(10, (index) => const Post()).toList()
        ],
      ),
    );
  }
}
