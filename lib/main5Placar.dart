import 'package:flutter/material.dart';

void main() {
  runApp(Recipe());
}

// abaixar o x
class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas da Vovó',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Bolo de Morango'),
          ),
          body: Container(
            margin: EdgeInsets.only(right: 30, left: 30, bottom: 30, top: 30),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/brasil.png',
                      width: 50,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("Brasil", style: TextStyle(fontSize: 20)),
                    Text("00", style: TextStyle(fontSize: 40))
                  ],
                ),
                Column(
                  children: [
                    Text("X", style: TextStyle(fontSize: 40)),
                  ],
                ),
                Column(
                  children: [
                    Text("Alemenha", style: TextStyle(fontSize: 20)),
                    Text("00", style: TextStyle(fontSize: 40))
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/germany.png',
                      width: 50,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
