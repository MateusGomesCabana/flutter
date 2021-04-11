import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = ['Laptop'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('First app')),
        body: Column(children: [
          Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _products.add('PC');
                    });
                  },
                  child: Text('Hello World'))),
          Column(
              children: _products
                  .map((element) => Card(
                        child: Column(
                          children: <Widget>[Text(element)],
                        ),
                      ))
                  .toList()),
        ]),
      ),
    );
  }
}
