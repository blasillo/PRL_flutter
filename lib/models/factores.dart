
class FactorRiesgo {

  String id;
  String nombre;

  FactorRiesgo.create( this.nombre);

  @override 
  bool operator ==(o) => o is FactorRiesgo && o.nombre == nombre && o.id == id;

  int get hashCode => nombre.hashCode ^ id.hashCode;
  
}