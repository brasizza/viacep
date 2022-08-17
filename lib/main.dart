import 'package:buscacep/controller/viacep_controller.dart';
import 'package:buscacep/repositories/viacep/i_viacep_repository.dart';
import 'package:buscacep/repositories/viacep/viacep_repository_rest.dart';
import 'package:buscacep/views/home_find.dart';
import 'package:buscacep/views/show_info.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<IViacepRepository>(ViacepRepositoryRest());
  GetIt.I.registerSingleton<ViacepController>(ViacepController(repository: GetIt.I<IViacepRepository>()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return HomeFind(controller: GetIt.I<ViacepController>());
        },
        '/infos': (context) => ShowInfo(controller: GetIt.I<ViacepController>())
      },
    );
  }
}
