import 'package:flutter/material.dart';

class CardMoney extends StatelessWidget {
  final dynamic data;
  final valorReal;

  CardMoney(this.data, this.valorReal);

  Widget build(BuildContext context) {
    print(this.data);
    return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Card(
            elevation: 5,
            child: SizedBox(
              height: 90,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    (this.data["name"].toString()),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ((this.data["buy"] == null
                            ? 0
                            : this.data["buy"] * this.valorReal)
                        .toString()),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    ((this.data["sell"] == null
                            ? 0
                            : this.data["sell"] * this.valorReal)
                        .toString()),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    (this.data["variation"].toString()),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )));
  }
}
