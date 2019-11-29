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
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount ( crossAxisCount:  2 ),
                itemCount: categorias.data.length,
                itemBuilder: (BuildContext context, int index){
                  final Categoria categoria = categorias.data[index];
                  return Container(
                            height: 120.0,
                            margin: EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 12.0 ),
                        child: Center(
                      child: Card(
                          child: Container (
                            width: 220.0,
                            height:220.0,
                            child: InkWell(
                               onTap: () => navegarACategoria (context, categoria),
                               child: Column( // Replace with a Row for horizontal icon + text
                               children: <Widget>[
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage (
                                             image: AssetImage('assets/imagenes/01_V-01.png') ,
                                             fit: BoxFit.cover,
                                  ))),
                                  //Icon(Icons.play_arrow, color: Colors.black,),
                                  Text (categoria.nombre , style: TextStyle(fontSize: 20.0, color: Colors.black))
                  ]
                      )))
                  )));
                },
              );


              /*ListView.builder(
                        itemCount: categorias.data.length,
                        itemBuilder: (BuildContext context , int index){
                          Categoria categoria = categorias.data[index];
                          return ListTile (
                            onTap: () => navegarACategoria (context, categoria),
                            title: Text (categoria.nombre , style: TextStyle(fontSize: 34.0)),
                          );
                        }  
              );    */
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

