import 'package:flutter/cupertino.dart';

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Row(
          children: [
            CupertinoButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(CupertinoIcons.back),
            ),
            Text('AppBar')
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        middle: Text('Page'),
      ),
      child: ListView(
        children: [],
      ),
    );
  }
}
