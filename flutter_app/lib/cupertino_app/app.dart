import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool airplaneMode=false;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.dark
      ),
      home: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Settings'),
              stretch: true,
              transitionBetweenRoutes: true,
            ),
            SliverList.list(children: [
              firstSection(),
              secondSection(),
            ])
          ],
        )
      ),
    );
  }

  Widget firstSection(){
    return CupertinoListSection(
      children: [
        CupertinoListTile(
            title: const Text('Airplane Mode'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeGreen,
            ),
            trailing: CupertinoSwitch(value: airplaneMode,onChanged: (value)=>setState(()=>airplaneMode=value),),
            onTap: () {}
        ),
        CupertinoListTile(
          title: const Text('Wi fi'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.systemRed,
          ),
          additionalInfo: const Text('Not available'),
          trailing: Icon(CupertinoIcons.chevron_forward,color: CupertinoColors.systemGrey),
        ),
        CupertinoListTile(
          title: const Text('Bluetooth'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.systemRed,
          ),
          additionalInfo: const Text('off'),
          trailing: Icon(CupertinoIcons.chevron_forward,color: CupertinoColors.systemGrey,),
        ),
        CupertinoListTile(
          title: const Text('Mobile Data'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.systemRed,
          ),
          additionalInfo: const Text('off'),
          trailing: Icon(CupertinoIcons.chevron_forward,color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }
  Widget secondSection(){
    return CupertinoListSection(
      children: [
        CupertinoListTile(
            title: const Text('Airplane Mode'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeGreen,
            ),
            trailing: CupertinoSwitch(value: airplaneMode,onChanged: (value)=>setState(()=>airplaneMode=value),),
            onTap: () {}
        ),
        CupertinoListTile(
          title: const Text('Wi fi'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.systemRed,
          ),
          additionalInfo: const Text('Not available'),
          trailing: Icon(CupertinoIcons.chevron_forward,color: CupertinoColors.systemGrey),
        ),
        CupertinoListTile(
          title: const Text('Bluetooth'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.systemRed,
          ),
          additionalInfo: const Text('off'),
          trailing: Icon(CupertinoIcons.chevron_forward,color: CupertinoColors.systemGrey,),
        ),
        CupertinoListTile(
          title: const Text('Mobile Data'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.systemRed,
          ),
          additionalInfo: const Text('off'),
          trailing: Icon(CupertinoIcons.chevron_forward,color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }
  List<Widget> thirdSection(){
    return [];
  }
}
