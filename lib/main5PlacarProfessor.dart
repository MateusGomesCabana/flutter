import 'package:flutter/material.dart';

import 'components/Body.dart';

void main() {
  runApp(Placar());
}

class Placar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Olá Amigos'),
          ),
          body: Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/brazil.png',
                      width: 10,
                    )
                  ],
                ),
                Column(
                  children: [Text("Brasil"), Text("00")],
                ),
                Column(
                  children: [Text("X")],
                ),
                Column(
                  children: [Text("México"), Text("00")],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/germany.png',
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
