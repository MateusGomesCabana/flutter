class AgendaDados {
  int id;
  String nome;
  String email;
  String endereco;
  String telefone;

  AgendaDados.empty() {
    id = null;
    email = "";
    nome = "";
    endereco = "";
    telefone = "";
  }

  AgendaDados(this.nome, this.email, this.endereco, this.telefone);
}
