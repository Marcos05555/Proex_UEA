import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.green,
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.green, textTheme: ButtonTextTheme.primary)),
        home: Dashboard());
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UEA')),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset('image/Vestibular_UEA_2019_1.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              Cardconfig('Entrar', Icons.exit_to_app, null),
              Cardconfig('Informações', Icons.info, null)
            ],
          ),
        ],
      )),
    );
  }
}

class Cardconfig extends StatelessWidget {
  final String stringName;
  final IconData icone;
  final Widget screenDesired;
  Cardconfig(this.stringName, this.icone, this.screenDesired);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 100.0, 4.0, 4.0),
      //decoration: BoxDecoration(color: Colors.black,border: Border.all(width:1),borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            //gera eventos
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screenDesired));
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icone,
                  color: Colors.white,
                  size: 30.0,
                ),
                Text(
                  stringName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
