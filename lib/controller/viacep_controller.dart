// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buscacep/models/modelo.dart';
import 'package:buscacep/repositories/viacep/i_viacep_repository.dart';
import 'package:mobx/mobx.dart';

part 'viacep_controller.g.dart';

class ViacepController = ViacepControllerBase with _$ViacepController;

abstract class ViacepControllerBase with Store {
  final IViacepRepository _repository;

  ViacepControllerBase({
    required IViacepRepository repository,
  }) : _repository = repository;

  @action
  Future<Modelo?> atualizaEndereco(String cep) async {
    final endereco = await _repository.buscarCep(cep);
    if (endereco == null || endereco.erro == true) {
      return null;
    }
    return endereco;
  }
}
