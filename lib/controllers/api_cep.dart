// viacep.com.br/ws/01001000/json/

// {
//    "cep": "01001-000",
//    "logradouro": "Praça da Sé",
//    "complemento": "lado ímpar",
//    "unidade": "",
//    "bairro": "Sé",
//    "localidade": "São Paulo",
//    "uf": "SP",
//    "ibge": "3550308",
//    "gia": "1004",
//    "ddd": "11",
//    "siafi": "7107"
// }
import 'dart:async';

import 'package:dio/dio.dart';

final dio = Dio();

Future<Map<String, dynamic>?> buscarCEP(String cep) async {
  final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
  return response.data;
}
