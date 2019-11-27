import 'package:flutter/material.dart';

import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/blocs/factores_bloc.dart';
import 'package:demo_app/models/factores.dart';

class SelectedCategoryPage extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {
    
    final FactoresBloc _factoresBloc = BlocProvider.of<FactoresBloc>(context);

    return Scaffold(
      appBar: AppBar( title: Text ('Demo PRL SDD Va')) ,
      body: StreamBuilder<List<FactorRiesgo>>(
        stream: _factoresBloc.outFactores ,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount ( crossAxisCount:  2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return Center(child: Text(snapshot.data[index].nombre));
              },
            );
          }
          return SizedBox();
        }
      )
    );
  }
}