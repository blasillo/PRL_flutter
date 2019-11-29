import 'package:demo_app/models/categorias.dart';
import 'package:demo_app/models/factores.dart';

class DbApi {

  static const String json = "{ id:'01' , nombre: 'Riesgo de accidente' , factores: [{id:'01', nombre:'Caídas de personas a distinto nivel'},"
      "{id:'02', nombre:'Caídas de personas al mismo nivel'},"
      "{id:'03', nombre:'Caidas de objetos por desplome o derrumbamiento'},"
      "{id:'04', nombre:'Caídas de objetos en manipulación'}] }" ;

  List<Categoria> getCategorias (){





    List<Categoria> tempList = [ Categoria.create('01', "Riesgo de accidente"),
                                 Categoria.create('02', "Riesgo de enfermedad"),
                                 Categoria.create('03', "Fatiga"),
                                 Categoria.create('04', "Insatisfacción") ];

    return tempList;
  }

  List<FactorRiesgo> getFactores(Categoria categoria) {

    List<FactorRiesgo> tempList = List();

    switch ( categoria.id ) {
      case '01': tempList = [ FactorRiesgo.create ( '01', 'Caídas de personas a distinto nivel'),
                              FactorRiesgo.create ( '02', 'Caídas de personas al mismo nivel'),
                              FactorRiesgo.create ( '03', 'Caídas de objetos por desplome o derrumbamiento'),
                              FactorRiesgo.create ( '04', 'Caídas de objetos en manipulación'),
                              FactorRiesgo.create ( '05', 'Caídas de objetos desprendidos'),
                              FactorRiesgo.create ( '06', 'Pisadas sobre objetos'),
                              FactorRiesgo.create ( '07', 'Choques contra objetos inmóviles'),
                              FactorRiesgo.create ( '08', 'Choque contra objetos móviles'),
      ];
                 break;

      case '02':
     }



    return tempList;
  }

}