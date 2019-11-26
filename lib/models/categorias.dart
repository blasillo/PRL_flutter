

class Categoria {

  static const _NOMBRE_ = 'nombre';

  String id;
  String nombre;

  Categoria () { 
    nombre='Riesgo de accidente';
  }
  
  Categoria.fromFirebase ( Map<String, dynamic> json){
    nombre = json [_NOMBRE_];
  }



}