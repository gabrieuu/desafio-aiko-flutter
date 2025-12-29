import 'package:solucao/data/models/posicao_veiculos/posicao_veiculo_response_dto.dart';
import 'package:solucao/infra/i_http_client.dart';

class PosicaoDosVeiculosRepository {
  final IHttpClient httpClient;

  PosicaoDosVeiculosRepository({required this.httpClient});

  Future<void> autenticar() async {
    await httpClient.post('/Login/Autenticar');
  }

  Future<PosicaoVeiculoResponseDTO> fetchPosicaoDosVeiculos() async {
    await autenticar();
    final response = await httpClient.get('/Posicao');
    return PosicaoVeiculoResponseDTO.fromJson(response as Map<String, dynamic>);
  }

}