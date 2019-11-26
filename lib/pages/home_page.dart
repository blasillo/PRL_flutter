import 'package:flutter/material.dart';

import 'package:demo_app/api/db_api.dart';
import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/blocs/categorias_bloc.dart';
import 'package:demo_app/models/categorias.dart';


class HomePage extends StatelessWidget {

  //final DbApi dbApi = DbApi();
  
  @override 
  Widget build (BuildContext context) {
    final CategoriasBloc _categoriasBloc = BlocProvider.of<CategoriasBloc>(context);
    return Scaffold(
      appBar: AppBar ( 
        title: Text ('Demo PRL SDD Va')),
        body: StreamBuilder(
          stream: _categoriasBloc.outCategorias,
          builder: (BuildContext context , AsyncSnapshot<List<Categoria>> categorias ){
            if (categorias.hasData) {
              return ListView.builder( 
                        itemCount: categorias.data.length,
                        itemBuilder: (BuildContext context , int index){
                          return ListTile (
                            //onTap: ,
                            title: Text (categorias.data[index].nombre , style: TextStyle(fontSize: 34.0)),
                          );
                        }  
              );     
            }
            else return Text ('No hay datos');
          }
        )
          
    );
  }

}

