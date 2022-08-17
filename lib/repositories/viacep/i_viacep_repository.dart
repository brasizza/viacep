import 'package:buscacep/models/modelo.dart';

abstract class IViacepRepository {
  Future<Modelo?> buscarCep(String cep);
}
