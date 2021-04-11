import 'package:flutter/material.dart';

void main() => runApp(_MyAppState());

class _MyAppState extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String resultado = "";
  final gasolinaControler = TextEditingController();
  final alcoolControler = TextEditingController();
  String calculaCombustivel(double gasolina, double alcool) {
    if (gasolina * 0.7 > alcool) {
      return "alcool";
    } else {
      return "gasolina";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/apple.png',
              height: 50,
              width: 50,
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              controller: gasolinaControler,
              obscureText: false,
              style: style,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "Valor da gasolina",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              controller: alcoolControler,
              obscureText: false,
              style: style,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "Valor do  alcool",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
            SizedBox(
              height: 5.0,
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                onPressed: () {
                  setState(() {
                    resultado = calculaCombustivel(
                        double.parse(gasolinaControler.text),
                        double.parse(alcoolControler.text));
                  });
                },
                child: Text("Calcula",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(!resultado.isEmpty ? "O melhor é $resultado" : "")
          ],
        ),
      ),
    )));
  }
}
