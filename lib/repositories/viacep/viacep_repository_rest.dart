import 'package:buscacep/models/modelo.dart';
import 'package:http/http.dart' as http;

import 'i_viacep_repository.dart';

class ViacepRepositoryRest implements IViacepRepository {
  @override
  Future<Modelo?> buscarCep(String cep) async {
    var uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = Modelo.fromJson(response.body);
      return data;
    }
    return null;
  }
}
