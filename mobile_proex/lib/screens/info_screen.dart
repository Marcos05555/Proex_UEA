import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('INFORMAÇÕES'),

    ),body: Padding(
      padding: const EdgeInsets.all(8.0),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0,50.0,30.0,100.0),
            child: Image.asset('image/montagem.jpg',),
          ),
          Padding(
            
            padding: const EdgeInsets.all(4.0),
            child: Text('Esse aplicativo foi desenvolvido pelos alunos da UEA para auxiliar de médicos do projeto da PROEX',style: TextStyle(fontSize: 24.0,color: Colors.green)),
          ),
        ],
      ),
    ),);
  }
}