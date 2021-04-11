import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: PrimeiraRota(),
  ));
}

class PrimeiraRota extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String resultado = "";
  String frase = "";
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
        appBar: AppBar(
          title: Text('Primeira Rota'),
        ),
        body: Scaffold(
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
                      resultado = calculaCombustivel(
                          double.parse(gasolinaControler.text),
                          double.parse(alcoolControler.text));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SegundaRota(!resultado.isEmpty
                                ? "O melhor é $resultado"
                                : "")),
                      );
                    },
                    child: Text("Calcula",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ))));
  }
}

class SegundaRota extends StatelessWidget {
  String resultado;
  SegundaRota(this.resultado);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota (tela)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.resultado),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Retornar !'),
            ),
          ],
        ),
      ),
    );
  }
}
