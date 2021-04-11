import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  TextStyle styleBase =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ola flutter coluna", style: styleBase),
              Text(
                "ola flutter coluna",
                style: styleBase,
              ),
              Text(
                "ola flutter coluna",
                style: styleBase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
