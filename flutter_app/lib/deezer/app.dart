import 'package:flutter/material.dart';
import 'package:flutter_app/deezer/widgets/track_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {

  int currentPage=0;

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
          body:Builder(builder: (context){
            if(currentPage==0)return TrackPage();
            return Container();
          }),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (index)=>setState(()=>currentPage=index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Account"
              ),
            ],
          ),
        )
    );
  }
}
