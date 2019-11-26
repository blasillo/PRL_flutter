import 'dart:async';

import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/models/categorias.dart';
import 'package:demo_app/api/db_api.dart';

class CategoriasBloc implements BlocBase {

  List<Categoria> _categorias;

  StreamController<List<Categoria>> _categoriasCtrl = StreamController<List<Categoria>>();

  Sink<List<Categoria>> get _inCategorias => _categoriasCtrl.sink;

  Stream<List<Categoria>> get outCategorias => _categoriasCtrl.stream;


  CategoriasBloc () { getCategorias(); }

  void getCategorias() {
    DbApi dbApi = DbApi();
    _categorias = dbApi.getCategorias();
    _inCategorias.add(_categorias);
  }

  @override 
  void dispose () {
     _categoriasCtrl.close();

  }
}
