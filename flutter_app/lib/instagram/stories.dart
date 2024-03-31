import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: 80,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    width: 80,height: 80,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffF0BE57),
                          Color(0xffE13A45),
                          Color(0xff9C0A94),
                        ],
                        // stops: [0,0.5,1],
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
                  Text("User name")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
