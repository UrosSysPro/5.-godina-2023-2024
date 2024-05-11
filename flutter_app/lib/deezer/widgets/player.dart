import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  final AudioPlayer player;
  const Player({super.key,required this.player});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.player.playerStateStream,
      builder: (context, snapshot) {
        bool playing=snapshot.data?.playing??false;
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background
          ),
          height: 80,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.fast_rewind)
              ),
              IconButton(
                  onPressed: (){
                    if(playing){
                      widget.player.pause();
                    }else{
                      widget.player.play();
                    }
                    setState(() {});
                  },
                  icon: Icon(playing?Icons.pause:Icons.play_arrow)
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.fast_forward)
              ),
            ],
          ),
        );
      }
    );
  }
}
