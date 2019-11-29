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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount ( crossAxisCount: 2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                final factor = snapshot.data[index];
                return InkWell(
                  onTap: () => { _evaluacionesBloc.addFactor (factor)},
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                        Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                color: Colors.redAccent,
                                border: new Border.all(
                                  color: Colors.black,
                                  width: 4.0,

                                ),
                                image: DecorationImage (
                                  image: AssetImage('assets/imagenes/'+ factor.id + '_V-01.png') ,
                                  fit: BoxFit.cover,
                                ))),
                //Icon(Icons.play_arrow, color: Colors.black,),
                    Text (factor.nombre) ]
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