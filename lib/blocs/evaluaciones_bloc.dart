import 'dart:async';
import 'package:rxdart/rxdart.dart';


import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/models/factores.dart';
import 'package:demo_app/models/evaluaciones.dart';
import 'package:demo_app/api/db_api.dart';


class EvaluacionesBloc extends BlocBase {

  Evaluacion evaluacion = Evaluacion();


  final _factoresCtrl = BehaviorSubject<List<FactorRiesgo>>();
  Sink<List<FactorRiesgo>> get _inFactores => _factoresCtrl.sink;
  Stream<List<FactorRiesgo>> get outFactores => _factoresCtrl.stream;


  final _countCtrl = BehaviorSubject<int>();
  Sink<int> get _inCount => _countCtrl.sink;
  Stream<int> get outCount => _countCtrl.stream;

  @override 
  void dispose () {
     _factoresCtrl.close();
     _countCtrl.close();
  }

}