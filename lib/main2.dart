import 'package:flutter/material.dart';

import 'components/Body.dart';

void main() {
  runApp(FriendsApp());
}

class FriendsApp extends StatelessWidget {
  TextStyle styleBase =
      new TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus amigos',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Olá Amigos'),
          ),
          body: Body()),
    );
  }
}
