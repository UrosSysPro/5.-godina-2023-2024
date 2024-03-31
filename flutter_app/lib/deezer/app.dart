import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/deezer/utils.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    getData();
  }
  Future<void> getData()async{
    var response=await Utils.search(type: SearchType.track, query: "eminem");
    var json=jsonDecode(response.body);
    var data=json['data'];
    for(var entry in data){
      var title=entry['title'];
      var id=entry['id'];
      print('title: $title\nid:$id\n\n');
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
