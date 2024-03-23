import 'package:flutter/material.dart';
import 'package:flutter_app/mani_page.dart';

void main(){
  runApp(MainPage());
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

//ui=build(state);
//osnovni widgeti
//  Text Image TextField
//  Row Stack Column Center Align Container

//material

//cupertino

class _AppState extends State<App> {
  var useMaterial3=true;
  var darkTheme=true;
  var colors=[Colors.green,Colors.blue,Colors.orange,Colors.red];
  var accentColor=Colors.green;
  var currentPage=0;
  var selectedItem=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: useMaterial3,
          colorScheme: ColorScheme.fromSeed(
              seedColor:accentColor,
              brightness: darkTheme?Brightness.dark:Brightness.light
          )
      ),
      title: "Flutter app",
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
              );
            }
          ),
          title: Text("App Bar"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("Material 3"),
              trailing: Switch(value: useMaterial3,onChanged: (value){
                setState(() {
                  useMaterial3=value;
                });
              },),
            ),
            ListTile(
              title: Text("Dark theme"),
              trailing: Switch(value: darkTheme,onChanged: (value){
                setState(() {
                  darkTheme=value;
                });
              },),
            ),
            ListTile(
              title: Text("Accent color"),
              trailing: SizedBox(
                height: 30,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: colors.map((e) =>
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: (){setState(() {
                          darkTheme=false;
                          accentColor=e;
                        });},
                        child: Container(
                          width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: e
                          ),
                        ),
                      ),
                    )
                  ).toList(),
                ),
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: Text("Click"),
          icon: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPage,
          // backgroundColor: accentColor,
          unselectedItemColor: Colors.black,
          selectedItemColor: accentColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "About"),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard),label: "Gift Card"),
          ],
          onTap: (index){
            setState(() {
              currentPage=index;
            });
          },
        ),
        drawer: Drawer(
          child: SizedBox(
            width: 300,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(100),
                    child: ListTile(
                      title: Text("Option $index"),
                      selected: index==selectedItem,
                      selectedTileColor: accentColor,
                      selectedColor: Colors.white,
                      onTap: ()=>setState(() {
                        selectedItem=index;
                      }),
                    ),
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
