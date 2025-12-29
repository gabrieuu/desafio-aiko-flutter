import 'package:flutter_test/flutter_test.dart';
import 'package:solucao/data/repository/posicao_dos_veiculos_repository.dart';
import 'package:solucao/infra/dio_client.dart';

void main() {
  test("deve retornar um map das posicoes dos veiculos", () async{
    PosicaoDosVeiculosRepository repository = PosicaoDosVeiculosRepository(httpClient: DioClient());
    await repository.autenticar();
    var posisaoVeiculos = await repository.fetchPosicaoDosVeiculos();
    int count = 0;
    for(var veiculos in posisaoVeiculos.linha){
      count += veiculos.quantidadeVeiculos;
    }
    print(count);
    expect(count > 0, true);
    expect(posisaoVeiculos.linha.isNotEmpty, true);
  });
}