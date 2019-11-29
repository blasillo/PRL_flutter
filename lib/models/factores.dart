
class FactorRiesgo {

  static const _NOMBRE_ = 'nombre';
  static const _ID_ = 'id';

  String id;
  String nombre;

  FactorRiesgo.create( this.id, this.nombre);

  @override 
  bool operator ==(o) => o is FactorRiesgo && o.nombre == nombre && o.id == id;

  int get hashCode => nombre.hashCode ^ id.hashCode;


  FactorRiesgo.fromMap (Map<String, dynamic> json){
    nombre = json [_NOMBRE_];
    id = json[_ID_];
  }
}