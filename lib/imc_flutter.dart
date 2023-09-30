import 'package:imc_flutter/model/pessoa.dart';
import 'package:imc_flutter/util/funcoes_utils.dart';

void execute() {
  print("Ola, vamos calcular seu IMC agora...");

  String nome = FuncoesUtils.lerNome();
  var pessoa = Pessoa(nome);

  double? peso;
  double? altura;

  do {
    peso = FuncoesUtils.lerDoubleComTexto("Digite seu peso em Kg (Ex.: 77.2)");
    if (peso != null && peso > 0) {
      pessoa.inserirPeso(peso);
    }
  } while (peso == null);

  do {
    altura = FuncoesUtils.lerDoubleComTexto(
        "Digite sua altura em metros (Ex.: 1.73)");
    if (altura != null && altura > 0) {
      pessoa.inserirAltura(altura);
    }
  } while (altura == null);

  if (peso <= 0.0 || altura <= 0.0) {
    print("Valores informados são incorretos:");
    print("Peso: $peso");
    print("Altura: $altura");
  } else {
    Map<String, dynamic> retorno = FuncoesUtils.calculaImc(peso, altura);

    FuncoesUtils.resultado(pessoa, retorno["valor"], retorno["msg"]);
  }
}
