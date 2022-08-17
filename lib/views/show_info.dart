import 'package:buscacep/models/modelo.dart';
import 'package:flutter/material.dart';

import '../controller/viacep_controller.dart';

class ShowInfo extends StatefulWidget {
  final ViacepController controller;
  const ShowInfo({Key? key, required this.controller}) : super(key: key);
  @override
  State<ShowInfo> createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  late final Modelo modeloCep;
  var ufName = 'br';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    modeloCep = ModalRoute.of(context)?.settings.arguments as Modelo;
    ufName = modeloCep.uf!.toLowerCase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busca do cep: ${modeloCep.cep ?? ''}'),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image(image: AssetImage('assets/imgs/$ufName.png')),
                ),
                Center(
                    child: Text('Estado: ${modeloCep.uf}',
                        style: const TextStyle(
                          fontSize: 20,
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text('Municipio: ${modeloCep.localidade}',
                        style: const TextStyle(
                          fontSize: 20,
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Bairro: ${modeloCep.bairro}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text('DDD Local: ${modeloCep.ddd}',
                        style: const TextStyle(
                          fontSize: 20,
                        ))),
              ],
            ),
          ]),
    );
  }
}
