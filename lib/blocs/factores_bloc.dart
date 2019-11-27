import 'dart:async';

import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/models/factores.dart';
import 'package:demo_app/models/categorias.dart';
import 'package:demo_app/api/db_api.dart';

class FactoresBloc implements BlocBase {

  List<FactorRiesgo> _factores;

  final StreamController <List<FactorRiesgo>> _factoresCtrl = StreamController<List<FactorRiesgo>>();
  Sink<List<FactorRiesgo>> get _inFactores => _factoresCtrl.sink;
  Stream<List<FactorRiesgo>> get outFactores => _factoresCtrl.stream;

  FactoresBloc(Categoria categoria) {
    getFactores (categoria);
  }
  
  void getFactores (Categoria categoria) {
    DbApi dbApi = DbApi();
    _factores = dbApi.getFactores (categoria);
    _inFactores.add (_factores);
  }

  @override
  void dispose () {
     _factoresCtrl.close();
  }
}
