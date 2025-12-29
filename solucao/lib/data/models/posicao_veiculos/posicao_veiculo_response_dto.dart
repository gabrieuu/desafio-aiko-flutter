import 'package:solucao/data/models/posicao_veiculos/linha_veiculo_response_dto.dart';

class PosicaoVeiculoResponseDTO {
  String hora;
  List<LinhaVeiculoResponseDto> linha;

  PosicaoVeiculoResponseDTO({
    required this.hora,
    required this.linha,
  });

  factory PosicaoVeiculoResponseDTO.fromJson(Map<String, dynamic> json) {
    return PosicaoVeiculoResponseDTO(
      hora: json['hr'],
      linha: (json['l'] as List).map((item) => LinhaVeiculoResponseDto.fromJson(item)).toList(),
    );
  }
}