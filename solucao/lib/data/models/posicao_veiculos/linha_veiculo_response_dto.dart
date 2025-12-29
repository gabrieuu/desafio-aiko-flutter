import 'package:solucao/data/models/posicao_veiculos/veiculo_localizado_response_dto.dart';

class LinhaVeiculoResponseDto {
  String letreiroCompleto;
  int codigoLinha;
  SentidoOperacao sentidoOperacao;
  String letreiroDestino;
  String letreiroOrigem;
  int quantidadeVeiculos;
  List<VeiculoLocalizadoResponseDto> veiculosLocalizados;

  LinhaVeiculoResponseDto({
    required this.letreiroCompleto,
    required this.codigoLinha,
    required this.sentidoOperacao,
    required this.letreiroDestino,
    required this.letreiroOrigem,
    required this.quantidadeVeiculos,
    required this.veiculosLocalizados,
  });

  factory LinhaVeiculoResponseDto.fromJson(Map<String, dynamic> json) {
    return LinhaVeiculoResponseDto(
      letreiroCompleto: json['c'],
      codigoLinha: json['cl'],
      sentidoOperacao: SentidoOperacao.fromCode(json['sl']),
      letreiroDestino: json['lt0'],
      letreiroOrigem: json['lt1'],
      quantidadeVeiculos: json['qv'],
      veiculosLocalizados: (json['vs'] as List)
          .map((e) => VeiculoLocalizadoResponseDto.fromJson(e))
          .toList(),
    );
  }
}

enum SentidoOperacao {
  principalToSecundario(1),
  secundarioToPrincipal(2);

  const SentidoOperacao(this.cod);
  
  factory SentidoOperacao.fromCode(int code) {
    return SentidoOperacao.values.firstWhere((e) => e.cod == code);
  }

  final int cod;
}