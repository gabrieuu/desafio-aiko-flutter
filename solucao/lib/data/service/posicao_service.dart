import 'package:solucao/data/mappers/veiculo_mapper.dart';
import 'package:solucao/data/repository/posicao_dos_veiculos_repository.dart';
import 'package:solucao/domain/models/veiculo_posicao.dart';

class PosicaoService {

  PosicaoDosVeiculosRepository repository;

  PosicaoService({required this.repository});

  Future<List<VeiculoPosicao>> getPosicaoVeiculos() async{
    var posicaoVeiculosResponse = await repository.fetchPosicaoDosVeiculos();

    var veiculosLocalizadosList = posicaoVeiculosResponse.linha.expand((e) => e.veiculosLocalizados);

    List<VeiculoPosicao> posicaoVeiculos = veiculosLocalizadosList
                                          .map(VeiculoMapper.veiculoLocalizadoResponseToVeiculoPosicao)
                                          .toList();

    return posicaoVeiculos;
  }

}