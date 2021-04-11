import 'package:base/components/AgendaDados.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AgendaRepository {
  static final AgendaRepository _singleton = new AgendaRepository();

  factory AgendaRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "agendaDB.db");
    var bd = await openDatabase(localDatabase, version: versiondb,
        onCreate: (db, versiondb) {
      String sql =
          "create table agenda(id integer primary key, nome varchar, telefone varchar, email varchar, endereco varchar)";
      db.execute(sql);
    });
    return bd;
  }

  static save(AgendaDados dados) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "nome": dados.nome,
      "telefone": dados.telefone,
      "email": dados.email,
      "endereco": dados.endereco
    };

    int id = await bd.insert("agenda", dadosResultado);
    print("salvou $id");
  }

  static Future list() async {
    Database bd = await _dataBaseManager();
    List listaContatos = await bd.rawQuery("select * from agenda");

    var _contatos = new List();
    for (var item in listaContatos) {
      var result = new AgendaDados(
          item['nome'], item['email'], item['endereco'], item['telefone']);
      result.id = item['id'];
      _contatos.add(result);
    }

    return _contatos;
  }

  static update(AgendaDados dados) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosContatos = {
      "nome": dados.nome,
      "telefone": dados.telefone,
      "email": dados.email,
      "endereco": dados.endereco
    };

    bd.update("agenda", dadosContatos, where: "id = ?", whereArgs: [dados.id]);
  }

  static delete(int contatoId) async {
    Database db = await _dataBaseManager();
    return await db.delete('agenda', where: 'id = ?', whereArgs: [contatoId]);
  }
}
