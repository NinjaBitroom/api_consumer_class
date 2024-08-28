import 'dart:async';

import 'package:api_consumer_class/models/address_model.dart';
import 'package:dio/dio.dart';

typedef Mapping = Map<String, dynamic>;

class ViaCepController {
  final _dio = Dio();

  Future<AddressModel> buscarCEP(String cep) async {
    try {
      final response = await _dio.get<Mapping>(
        'https://viacep.com.br/ws/$cep/json/',
      );
      if (response.data!.containsKey('erro')) {
        throw Exception('CEP não encontrado');
      }
      if (response.statusCode == 200) {
        return AddressModel.fromMap(response.data!);
      }
      throw Exception('Erro ao buscar CEP');
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('CEP inválido');
      }
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
