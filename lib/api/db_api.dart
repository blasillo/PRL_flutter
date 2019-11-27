import 'package:demo_app/models/categorias.dart';
import 'package:demo_app/models/factores.dart';

class DbApi {

  List<Categoria> getCategorias (){

    List<Categoria> tempList = [ Categoria(), Categoria(), Categoria()];

    return tempList;
  }

  List<FactorRiesgo> getFactores(Categoria categoria) {

    List<FactorRiesgo> tempList = [ FactorRiesgo.create ('Caidas de personas a distinto nivel'),
                                FactorRiesgo.create ('Caidas de personas al mismo nivel'),
                                FactorRiesgo.create ('Caidas de objetos por desplome o derrumbamiento'),
                                FactorRiesgo.create ('Caidas de objetos en manipulación'),];

    return tempList;
  }

}