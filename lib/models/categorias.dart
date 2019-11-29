

class Categoria {

  static const _NOMBRE_ = 'nombre';
  static const _ID_ = 'id';

  String id;
  String nombre;

  Categoria.create (this.id, this.nombre);
  
  Categoria.fromFirebase ( Map<String, dynamic> json){
    nombre = json [_NOMBRE_];
    id = json[_ID_];
  }

  Categoria.fromMap (Map<String, dynamic> json){
    nombre = json [_NOMBRE_];
    id = json[_ID_];
  }



}