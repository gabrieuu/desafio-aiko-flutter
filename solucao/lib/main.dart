import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solucao/data/repository/posicao_dos_veiculos_repository.dart';
import 'package:solucao/data/service/posicao_service.dart';
import 'package:solucao/infra/dio_client.dart';
import 'package:solucao/infra/i_http_client.dart';
import 'package:solucao/pages/mapa_page.dart';
import 'package:solucao/pages/mapa_view_controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<IHttpClient>(create: (_) => DioClient()),
      Provider<PosicaoDosVeiculosRepository>(create: (context) => PosicaoDosVeiculosRepository(httpClient: context.read<IHttpClient>()),),
      Provider<PosicaoService>(create: (context) => PosicaoService(
        repository: context.read<PosicaoDosVeiculosRepository>(),
      )),
      ChangeNotifierProvider<MapaViewController>(create: (context) => MapaViewController(
        context.read<PosicaoService>(),
      )),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MapaPage(),
    );
  }
}