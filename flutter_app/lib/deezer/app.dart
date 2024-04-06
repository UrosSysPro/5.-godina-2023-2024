import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/deezer/models/artist.dart';
import 'package:flutter_app/deezer/models/track.dart';
import 'package:flutter_app/deezer/utils.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  Future<ApiResponse>? search;
  bool isSearching=false;
  String searchParam="";

  @override
  void initState() {
    super.initState();
    search=Utils.search(type: SearchType.track, query: "eminem");
    getData();
  }
  Future<void> getData()async{
    var response=await Utils.search(type: SearchType.track, query: "eminem");
    var json=jsonDecode(response.body);
    var data=json['data'];
    for(var entry in data){
      print('$entry');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark
        )
      ),
      title: '',
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(isSearching?Icons.arrow_back:Icons.search),
              onPressed: ()=>setState(()=>isSearching=!isSearching),
            ),
            title: GestureDetector(
              onTap: ()=>setState(()=>isSearching=true),
              child: isSearching?TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: null,
                ),
                initialValue: searchParam,
                onChanged: (value)=>setState(() {
                  searchParam=value;
                  search=Utils.search(type: SearchType.track, query: searchParam);
                }),
              ):Text(searchParam.length==0?"Search":searchParam),
            ),
          ),
          body: Builder(
            builder: (context) {
              return Stack(
                children: [
                  FutureBuilder(future: search, builder: (context,snapshot){
                    if(snapshot.data != null){
                      List<Track> list=[];
                      var json=jsonDecode(snapshot.data!.body);
                      var data=json['data'];
                      if(data==null)return Center(child: Text("No Data"),);
                      for(var entry in data){
                        list.add(Track(
                          id: entry['id'],
                          title: entry['title'],
                          preview: entry['preview'],
                          artist: Artist(
                            id:entry['artist']['id'],
                            picture: entry['artist']['picture'],
                            link: entry['artist']['link'],
                            name: entry['artist']['name']
                          )
                        ));
                      }
                      return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context,index)=>ListTile(
                          leading: SizedBox(
                            height: 30,width: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              clipBehavior: Clip.antiAlias,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(list[index].artist.picture),
                              ),
                            ),
                          ),
                          title: Text(list[index].title),
                          subtitle: Text(list[index].artist.name),
                        ),
                      );
                    }else{
                      return Center(child: Text('no'),);
                    }
                  }),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background
                      ),
                    ),
                  )
                ],
              );
            }
          ),
        )
    );
  }
}
