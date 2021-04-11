import 'dart:convert';
import 'package:base/components/CardMoney.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// https://stackoverflow.com/questions/56326005/how-to-use-expanded-in-singlechildscrollview

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
  ));
}

double valorReal = 1;

Future<Map> getData() async {
  String request = "https://api.hgbrasil.com/finance?format=json&key=ea886132";
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final valorController = TextEditingController(text: valorReal.toString());

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cotação de Moedas",
        home: Scaffold(
          appBar: AppBar(title: Text("Conversor de Moedas")),
          body: Container(
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: valorController,
                  textAlign: TextAlign.center,
                  style: style,
                ),
                ElevatedButton(
                  child: Text("Botão"),
                  onPressed: () {
                    setState(() {
                      if (valorController.text.isNotEmpty) {
                        valorReal = double.parse(valorController.text);
                      } else {
                        valorReal = 1;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: FutureBuilder<Map>(
                      future: getData(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Center(
                              child: Text("Esperando"),
                            );
                          case ConnectionState.waiting:
                            return Center(
                                child: Text(
                              "Aguarde...",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 30.0),
                              textAlign: TextAlign.center,
                            ));
                          default:
                            print(snapshot.data["results"]["currencies"]);
                            if (snapshot.hasError) {
                              return Center(child: Text("error"));
                            }
                            return Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["USD"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["EUR"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["GBP"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["ARS"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["CAD"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["AUD"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["JPY"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["CNY"],
                                      valorReal),
                                  new CardMoney(
                                      snapshot.data["results"]["currencies"]
                                          ["BTC"],
                                      valorReal),
                                ],
                              ),
                            );
                        }
                      }),
                )),
              ],
            ),
          ),
        ));
  }
}
