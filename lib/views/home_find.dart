import 'package:buscacep/controller/viacep_controller.dart';
import 'package:flutter/material.dart';

class HomeFind extends StatefulWidget {
  final ViacepController controller;
  const HomeFind({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeFind> createState() => _HomeFindState();
}

class _HomeFindState extends State<HomeFind> {
  final cepEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Image(image: AssetImage('assets/imgs/viaCep.png')),
            ),
            TextFormField(
              controller: cepEC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'CEP',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                final dadosCep = await widget.controller.atualizaEndereco(cepEC.text);
                if (dadosCep == null) {
                  const snackBar = SnackBar(
                    content: Text('Ops! Cep não encontrado!'),
                  );
                  if (!mounted) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  if (!mounted) {
                    return;
                  }
                  Navigator.of(context).pushNamed('/infos', arguments: dadosCep);
                  cepEC.clear();
                }
              },
              child: const Text('Buscar Cep'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Informe o CEP acima (Somente numeros)'),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Created by : JB Silva',
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.red),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
