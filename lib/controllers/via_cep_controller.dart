import 'dart:async';

import 'package:api_consumer_class/models/address_model.dart';
import 'package:dio/dio.dart';

class ViaCepController {
  final _dio = Dio();

  Future<AddressModel> buscarCEP(String cep) async {
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        return AddressModel.fromMap(response.data);
      } else {
        throw Exception('Erro ao buscar CEP');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
