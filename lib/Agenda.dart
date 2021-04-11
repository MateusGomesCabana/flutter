import 'package:base/components/CardAgenda.dart'; //card da agenda
import 'package:base/components/AgendaDados.dart'; //dados da agenda
import 'package:base/repository/AgendaRepository.dart'; //banco da agenda
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyList());

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar Futebol',
      home: _Lista(),
    );
  }
}

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_Lista> {
  final title = 'Agenda';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            CadastroView(AgendaDados.empty())));

                setState(() {});
              },
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
              future: AgendaRepository.list(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: new Card(
                          child: CardAgenda(snapshot.data[index]),
                        ),
                        onTap: () {
                          _showMenuOption(context, snapshot.data[index]);
                        },
                      );
                    });
              }),
        ),
      ),
    );
  }

  void _showMenuOption(BuildContext context, AgendaDados dados) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 200,
            color: Colors.blue[200],
            child: Column(
              children: [
                _button("Ligar", context, () async {
                  // lauch("tel");
                  var url = "tel:${dados.telefone}";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                  Navigator.pop(context);
                }),
                _button("Editar", context, () async {
                  Navigator.pop(context);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastroView(dados)));
                  setState(() {});
                }),
                _button("Excluir", context, () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Deletar"),
                          content:
                              Text("Deseja deletar o contato ${dados.nome}?"),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Approve'),
                              onPressed: () {
                                AgendaRepository.delete(dados.id);
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }),
                _button("fechar", context, () {
                  Navigator.pop(context);
                })
              ],
            ),
          );
        });
  }

  Widget _button(title, context, function) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: FlatButton(
        color: Colors.red,
        child: Text(
          title,
          style: TextStyle(color: Colors.yellow, fontSize: 20.0),
        ),
        onPressed: function,
      ),
    );
  }
}

//view da agenda
class AgendaView extends StatelessWidget {
  final AgendaDados _agendaDados;

  AgendaView(this._agendaDados);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contato"),
      ),
      body: Center(
        child: Column(
          children: [
            CardAgenda(this._agendaDados),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        child: Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
          ],
        ),
      ),
    );
  }
}

//tela resposavel pelo cadastro
class CadastroView extends StatelessWidget {
  final AgendaDados dados;
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final nome = TextEditingController();
  final email = TextEditingController();
  final endereco = TextEditingController();
  final telefone = TextEditingController();

  CadastroView(this.dados);

  @override
  Widget build(BuildContext context) {
    nome.text = dados.nome;
    email.text = dados.email;
    endereco.text = dados.endereco;
    telefone.text = dados.telefone;

    return Scaffold(
        appBar: AppBar(
          title: Text("Agenda"),
        ),
        body: Container(
          padding: new EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: nome,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Nome",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: email,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: endereco,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Endereço",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: telefone,
                obscureText: false,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Telefone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              RaisedButton(
                child: Text(dados.id == null ? "Salvar" : "Atualizar"),
                onPressed: () {
                  dados.nome = nome.text;
                  dados.email = email.text;
                  dados.endereco = endereco.text;
                  dados.telefone = telefone.text;

                  // _resultados.add(novoResultado);
                  if (dados.nome.isEmpty) {
                    Toast.show("Digite o nome", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  } else if (dados.telefone.isEmpty) {
                    Toast.show("Digite o telefone", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  } else {
                    if (dados.id == null) {
                      AgendaRepository.save(dados);
                    } else {
                      AgendaRepository.update(dados);
                    }
                    Navigator.of(context).pop();
                  }
                },
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
            ],
          ),
        ));
  }
}
