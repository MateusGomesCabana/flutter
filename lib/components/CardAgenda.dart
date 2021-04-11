import 'package:base/components/AgendaDados.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardAgenda extends StatelessWidget {
  final AgendaDados dados;

  CardAgenda(this.dados);

  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(this.dados.nome),
              subtitle: Text(this.dados.telefone),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Ligar'),
                  onPressed: () async {
                    var url = "tel:${this.dados.telefone}";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
