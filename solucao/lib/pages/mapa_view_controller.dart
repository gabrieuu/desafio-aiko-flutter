import 'package:flutter/foundation.dart';
import 'package:solucao/data/service/posicao_service.dart';
import 'package:solucao/domain/models/veiculo_posicao.dart';

class MapaViewController extends ChangeNotifier{

  final PosicaoService _posicaoService;

  MapaViewController(this._posicaoService);

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<VeiculoPosicao> _posicaoVeiculos = [];
  List<VeiculoPosicao> get posicaoVeiculos => _posicaoVeiculos;

  void setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchPosicaoDosVeiculos() async{
    setLoading(true);
    _posicaoVeiculos = await _posicaoService.getPosicaoVeiculos();
    setLoading(false);
  }
}