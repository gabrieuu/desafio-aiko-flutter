class VeiculoLocalizadoResponseDto {
  int prefixoVeiculo;
  bool isAcessivelPorDeficientes;
  DateTime horarioLocalizacaoCapturadaUTC;
  double latitudeVeiculo;
  double longitudeVeiculo;

  VeiculoLocalizadoResponseDto({
    required this.prefixoVeiculo,
    required this.isAcessivelPorDeficientes,
    required this.horarioLocalizacaoCapturadaUTC,
    required this.latitudeVeiculo,
    required this.longitudeVeiculo,
  });

  factory VeiculoLocalizadoResponseDto.fromJson(Map<String, dynamic> json) {
    return VeiculoLocalizadoResponseDto(
      prefixoVeiculo: json['p'],
      isAcessivelPorDeficientes: json['a'],
      horarioLocalizacaoCapturadaUTC:
          DateTime.parse(json['ta']),
      latitudeVeiculo: json['py'],
      longitudeVeiculo: json['px'],
    );
  }

}