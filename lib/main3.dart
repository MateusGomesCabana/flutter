import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextStyle styleBase =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/1.jpg',
              height: 100,
              width: 100,
            ),
            Text("ola flutter coluna", style: styleBase),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Lorem ipsum curabitur at cursus aenean cubilia purus consequat sagittis adipiscing tempus condimentum orci, amet lobortis cubilia in pharetra non dapibus potenti massa imperdiet aliquam.",
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.green[500]),
                Icon(Icons.star, color: Colors.black),
                Icon(Icons.star, color: Colors.black),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.kitchen, color: Colors.green[500]),
                      Text('PREP:'),
                      Text('25 min'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.timer, color: Colors.green[500]),
                      Text('COOK:'),
                      Text('1 hr'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.restaurant, color: Colors.green[500]),
                      Text('FEEDS:'),
                      Text('4-6'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
