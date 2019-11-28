import 'package:flutter/material.dart';
import 'package:demo_app/pages/home_page.dart';
import 'package:demo_app/blocs/bloc_provider.dart';
import 'package:demo_app/blocs/evaluaciones_bloc.dart';
import 'package:demo_app/blocs/categorias_bloc.dart';

void main() => runApp(
  BlocProvider<EvaluacionesBloc> (
    bloc: EvaluacionesBloc() ,
    child: MyApp())
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo PRL SDD Va',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CategoriasBloc> (
        bloc: CategoriasBloc(),
        child: HomePage()
      ),
    );
  }
}


