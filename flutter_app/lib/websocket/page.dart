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
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Icon(CupertinoIcons.back),
            ),
            const Text('AppBar')
          ],
        ),
        middle: const Text('Page'),
      ),
      child: ListView(
        children: const [],
      ),
    );
  }
}
