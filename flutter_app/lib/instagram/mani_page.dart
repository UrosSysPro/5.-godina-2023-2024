import 'package:flutter/material.dart';
import 'package:flutter_app/instagram/home_view.dart';
import 'package:flutter_app/instagram/search_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedPage=0;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark
        )
      ),
      title: "Instagram clone",
      home: Scaffold(
        body: Builder(builder: (context){
          switch(selectedPage){
            case 0:return const HomeView();
            case 1:return const SearchView();
            default:return Container();
          }
        },),
        bottomNavigationBar: Builder(
          builder: (context) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedPage,
              backgroundColor: Theme.of(context).colorScheme.background,
              selectedItemColor: Theme.of(context).colorScheme.onBackground,
              unselectedItemColor: Theme.of(context).colorScheme.onBackground,
              onTap: (index){
                setState(() {
                  selectedPage=index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: selectedPage==0?
                    const Icon(Icons.home):
                    const Icon(Icons.home_outlined),
                  label: "home"
                ),
                BottomNavigationBarItem(
                    icon: selectedPage==1?
                      const Icon(Icons.search):
                      const Icon(Icons.search_outlined),
                    label: "search"
                ),
                BottomNavigationBarItem(
                    icon: selectedPage!=2?
                      const Icon(Icons.add_box_outlined):
                      const Icon(Icons.add_box),
                    label: "add"
                ),
                BottomNavigationBarItem(
                    icon: selectedPage==3?
                      const Icon(Icons.play_circle):
                      const Icon(Icons.play_circle_outline),
                    label: "reels"
                ),
                BottomNavigationBarItem(
                    icon: selectedPage==4?
                      const Icon(Icons.person):
                      const Icon(Icons.person_outline),
                    label: "about"
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
