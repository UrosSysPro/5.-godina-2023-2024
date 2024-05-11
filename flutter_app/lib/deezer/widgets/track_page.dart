import 'package:flutter/material.dart';
import 'package:flutter_app/deezer/models/track.dart';
import 'package:flutter_app/deezer/utils.dart';
import 'package:flutter_app/deezer/widgets/player.dart';
import 'package:just_audio/just_audio.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {

  Future<ApiResponse>? search;
  final player=AudioPlayer();
  bool isSearching=false;
  String searchParam="";

  @override
  void initState() {
    super.initState();
    search=Utils.search(type: SearchType.track, query: 'Eminem');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: search,
        builder: (context,snapshot) {
        List<Track> list=snapshot.data==null||snapshot.data?.body==null?
          []:Track.fromString(snapshot.data!.body);
          return Column(
            children: [
              Expanded(child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    leading: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: (){},
                    ),
                    title: const Text("Text"),
                  ),
                  SliverList.builder(
                    itemCount: list.length,
                    itemBuilder: (context,index)=>ListTile(
                      onTap: ()=>player.setUrl(list[index].preview),
                      title: Text(list[index].title),
                      subtitle: Text(list[index].artist.name),
                      leading: Container(
                        clipBehavior: Clip.antiAlias,
                        width: 30,height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.network(list[index].artist.picture,fit: BoxFit.cover,),
                      ),
                    )
                  )
                ],
              )),
              Player(player: player,),
            ],
          );
        }
    );
  }
}
