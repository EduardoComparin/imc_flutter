class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  Pessoa(String nome, {double peso = 0.0, double altura = 0.0}) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  void inserirPeso(double peso) {
    _peso = peso;
  }

  void inserirAltura(double altura) {
    _altura = altura;
  }

  @override
  String toString() {
    return {"Nome": _nome, "Peso": _peso, "Altura": _altura}.toString();
  }
}
