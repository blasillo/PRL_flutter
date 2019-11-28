import 'package:demo_app/blocs/evaluaciones_bloc.dart';
import 'package:demo_app/ui/evaluacion_button.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/blocs/factores_bloc.dart';
import 'package:demo_app/models/factores.dart';

class SelectedCategoryPage extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {
    
    final FactoresBloc _factoresBloc = BlocProvider.of<FactoresBloc>(context);
    final EvaluacionesBloc _evaluacionesBloc =  BlocProvider.of<EvaluacionesBloc>(context);
    


    return Scaffold(
      appBar: AppBar( 
        title: Text ('Demo PRL SDD Va'),
        actions: <Widget>[EvaluacionButton()],
        ) ,
      body: StreamBuilder<List<FactorRiesgo>>(
        stream: _factoresBloc.outFactores ,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount ( crossAxisCount:  2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                final factor = snapshot.data[index];
                return InkWell(
                  onTap: () => { _evaluacionesBloc.addFactor (factor)},
                  child: Center (
                    child:Text (factor.nombre)
                  )
                );
              },
            );
          }
          return SizedBox();
        }
      )
    );
  }
}