import 'package:flutter/material.dart';

import 'package:demo_app/api/db_api.dart';


class HomePage extends StatelessWidget {

  final DbApi dbApi = DbApi();
  
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar ( 
        title: Text ('Demo PRL SDD Va')),
        body: ListView.builder( 
          itemCount: dbApi.getCategorias().length,
          itemBuilder: (BuildContext context , int index){
            return Text ( dbApi.getCategorias()[index].nombre );
          },
        )
        );
  }

}