

import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/blocs/evaluaciones_bloc.dart';
import 'package:demo_app/pages/evaluaciones_page.dart';
import 'package:flutter/material.dart';

class EvaluacionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _evaluacionBloc = BlocProvider.of<EvaluacionesBloc>(context);
    
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => EvaluacionesPage()
            ));
          },
          icon: Icon ( Icons.control_point  )
        ),
        Positioned (
          top: 5,
          right: 5,
          child: CircleAvatar(
            radius:  8.0,
            backgroundColor: Colors.red,
            child: StreamBuilder<int> (
              stream: _evaluacionBloc.outCount,
              initialData: 0,
              builder: (context, snapshot) {
                return Text (snapshot.data.toString(),
                  style: TextStyle(fontSize:12.0));
              }
            ),
          ),)
      ],
    );
  }
  
}