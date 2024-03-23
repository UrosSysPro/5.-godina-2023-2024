import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    padding: EdgeInsets.all(3),
                    width: 50,height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xffF0BE57),
                            Color(0xffE13A45),
                            Color(0xff9C0A94),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).colorScheme.background
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Name"),
                          Text("Subtitle",style: TextStyle(fontSize: 12,color: Colors.grey),)
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
                ]
            ),
          ),
        ),
        Container(
          height: 400,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline)),
                IconButton(onPressed: (){}, icon: Icon(Icons.send)),
                Expanded(child: Align(alignment: Alignment.centerRight,child: Icon(
                  Icons.bookmark_outline
                ),))
              ],
            ),
          ),
        )
      ],
    );
  }
}
