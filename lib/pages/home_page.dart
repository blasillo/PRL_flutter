import 'package:flutter/material.dart';

import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/blocs/categorias_bloc.dart';
import 'package:demo_app/blocs/factores_bloc.dart';
import 'package:demo_app/models/categorias.dart';
import 'package:demo_app/models/factores.dart';
import 'package:demo_app/pages/selected_page.dart';

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
                          Categoria categoria = categorias.data[index];
                          return ListTile (
                            onTap: () => navegarACategoria (context, categoria),
                            title: Text (categoria.nombre , style: TextStyle(fontSize: 34.0)),
                          );
                        }  
              );     
            }
            else return Text ('No hay datos');
          }
        )
          
    );
  }


  void navegarACategoria(BuildContext context , Categoria categoria ){
    Navigator.of(context).push( MaterialPageRoute (
                              builder: (BuildContext context) => BlocProvider<FactoresBloc> (
                                bloc: FactoresBloc(categoria),
                                child: SelectedCategoryPage(),
                              )
                            ));
  }

}

