import 'dart:math';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late RecorderController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=RecorderController();
    controller.record();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange,brightness: Brightness.dark),
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Expanded(
              child: AudioWaveforms(
                size: const Size(300, 200.0),
                recorderController: controller,
                waveStyle: const WaveStyle(
                  waveColor: Colors.white,
                  showDurationLabel: true,
                  spacing: 8.0,
                  showBottom: false,
                  extendWaveform: true,
                  showMiddleLine: false,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: controller.onCurrentDuration,
                      builder: (context, snapshot) {
                        if(!snapshot.hasData||snapshot.data==null){
                          return const Center(
                            child: Text("no data"),
                          );
                        }else{
                          return Row(
                            children: List.generate(5, (index) =>
                                max(0,controller.waveData.length-5)).map((e) =>
                                Expanded(child: Text(controller.waveData[e].toStringAsFixed(4)))
                            ).toList()
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: controller.onRecorderStateChanged,
                      builder: (context, snapshot) {
                        var paused=snapshot.data?.index==0;
                        return Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                if(!paused) {
                                  controller.pause();
                                } else {
                                  controller.reset();
                                  controller.refresh();
                                  controller.record();
                                }
                              },
                              icon: Icon(paused?Icons.play_arrow:Icons.pause),
                            )
                          ],
                        );
                      }
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
