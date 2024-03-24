import 'dart:math';

import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<List<Color>> colors;
  @override
  void initState() {
    super.initState();
    var list=[
      // Colors.green,
      // Colors.red,
      // Colors.blue,
      // Colors.orange,
      // Colors.purple,
      // Colors.lime,
      // Colors.teal,
      // Colors.redAccent,
      // Colors.deepPurpleAccent
      Colors.grey,
      Colors.black,
      Colors.black12,
      Colors.black26,
      Colors.black38,
      Colors.black45,
      Colors.black54,
      Colors.black87,
    ];
    var r=new Random();
    colors=List.generate(3, (index) =>
      List.generate(10,(index)=>
        list[r.nextInt(list.length)
      ]).toList()
    ).toList();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          color: Theme.of(context).colorScheme.background,
          child: Container(
              decoration: BoxDecoration(
                  color: new Color(0xff252525),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 4,),
                    Expanded(
                      child: TextField(
                        decoration: null,
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
        ...List.generate(10, (j) =>AspectRatio(
          aspectRatio: 3,
          child: Row(
            children: List.generate(3, (i) => Expanded(
              child: Container(color: colors[i][j],),
            )).toList()
          ),
        )).toList()
      ],
    );
  }
}
