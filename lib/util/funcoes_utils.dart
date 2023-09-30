import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:imc_flutter/exception/nome_invalido_exception.dart';
import 'package:imc_flutter/model/pessoa.dart';

class FuncoesUtils {
  static String lerStringComTexto(String texto) {
    print(texto);
    return lerString();
  }

  static double? lerDoubleComTexto(String texto) {
    print(texto);
    return lerDouble();
  }

  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble() {
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static String lerNome() {
    String nome = lerStringComTexto("Digite seu nome:");

    try {
      if (nome.trim() == "") {
        throw NomeInvalidoException();
      }
    } on NomeInvalidoException {
      print(NomeInvalidoException);
      exit(0);
    } catch (e) {
      print(e);
      exit(0);
    }

    return nome;
  }

  static Map<String, dynamic> calculaImc(double peso, double altura) {
    String msg = "";
    Map<String, String> retorno = HashMap();

    double imc = peso / (altura * altura);

    if (imc.isNaN) {
      retorno.addAll({
        "msg":
            "Não foi possível calcular o IMC valores informados estão incoretos"
      });
      retorno.addAll({"valor": "0"});
    } else {
      if (imc < 16) {
        msg = 'Magreza grave';
      } else if (imc < 17) {
        msg = 'Magreza moderada';
      } else if (imc < 18.5) {
        msg = 'Magreza leve';
      } else if (imc < 25) {
        msg = 'Saudável';
      } else if (imc < 30) {
        msg = 'Sobrepeso';
      } else if (imc < 35) {
        msg = 'Obesidade – Grau I';
      } else if (imc < 40) {
        msg = 'Obesidade – Grau II (Severa)';
      } else {
        msg = 'Obesidade – Grau III (Mórbida)';
      }

      retorno.addAll({"msg": msg});
      retorno.addAll({"valor": imc.toStringAsFixed(2)});
    }

    return retorno;
  }

  static void resultado(Pessoa pessoa, String valor, String msg) {
    print("##########################################");
    print("Resutado do teste de IMC do ${pessoa.getNome()}");
    print('Seu IMC é $valor');
    print('Definido como $msg');
    print("___________________________________________");
    print("Peso informado foi : ${pessoa.getPeso()}");
    print("Altura informada foi : ${pessoa.getAltura()}");
    print("___________________________________________");
  }
}
