import 'package:solucao/data/models/posicao_veiculos/veiculo_localizado_response_dto.dart';
import 'package:solucao/domain/models/veiculo_posicao.dart';

class VeiculoMapper {

  static VeiculoPosicao veiculoLocalizadoResponseToVeiculoPosicao(VeiculoLocalizadoResponseDto dto){
    return VeiculoPosicao(
      codigoVeiculo: dto.prefixoVeiculo, 
      latitude: dto.latitudeVeiculo, 
      longitude: dto.longitudeVeiculo);
  }
}