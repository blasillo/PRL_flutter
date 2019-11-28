import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/blocs/evaluaciones_bloc.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/models/factores.dart';

  
class EvaluacionesPage extends StatelessWidget {  


  
  @override 
  Widget build (BuildContext context) {
    final _evaluacionBloc = BlocProvider.of<EvaluacionesBloc>(context); 
    return Scaffold (
      appBar: AppBar ( title: Text ('Demo PRL SDD Va: Inspección')), 
        body: StreamBuilder<List<FactorRiesgo>>(
          stream: _evaluacionBloc.outFactores,
          initialData: [],
          builder: (context, snapshot) {
            if ( snapshot.data.isNotEmpty) { // ver datos
               return ListView.builder(
                 itemCount: snapshot.data.length,
                 itemBuilder: (context, index){
                   final factor = snapshot.data[index];
                   return ListTile(
                     title: Text(factor.nombre),
                     trailing: Text ('Evaluar')
                   );
                 },
               );
            }
            else {
              return Center(
                child: Text('No hay datos'),
              );
            }
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon (Icons.camera_alt),
        ),
    );
  }
}