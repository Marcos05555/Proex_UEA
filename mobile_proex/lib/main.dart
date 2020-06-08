import 'package:flutter/material.dart';
import 'package:mobile_proex/Database/app_database.dart';
import 'package:mobile_proex/screens/home_screen.dart';
import 'package:mobile_proex/screens/info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 createDatabase();
 
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
              Cardconfig('ENTRAR', Icons.exit_to_app, HomeScreen()),
              Cardconfig('INFORMAÇÕES', Icons.info, InfoScreen())
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
            width: 160,
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
