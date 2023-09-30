import 'package:imc_flutter/util/funcoes_utils.dart' ;
import 'package:test/test.dart';

void main() {
  test('Calcula IMC', () {

    Map<String, String> retorno = {
        "msg": "Sobrepeso",
        "valor": "26.81"
    };

    expect(FuncoesUtils.calculaImc(73, 1.65), equals(retorno));
  });

    test('Calcula IMC Parametros zerados', () {

    Map<String, String> retorno = {
        "msg": "Não foi possível calcular o IMC valores informados estão incoretos",
        "valor": "0"
    };

    expect(FuncoesUtils.calculaImc(0, 0), equals(retorno));
  });

}

