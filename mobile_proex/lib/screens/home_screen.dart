import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_proex/main.dart';
import 'package:mobile_proex/screens/Screen_pacientes.dart';
import 'package:mobile_proex/screens/Screen_registration.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              image: new ExactAssetImage(
                                  'image/Vestibular_UEA_2019_1.png')),
                        ),
                      )),
                  Text(
                    'PROEX UEA',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            LisTileInfo(Icons.people, 'Pacientes', PatientScreen()),
            LisTileInfo(Icons.person_add, 'Cadastrar paciente',RegisterScreen()),
            LisTileInfo(Icons.exit_to_app, 'SAIR', MyApp()),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset('image/Vestibular_UEA_2019_1.png'),
          ),
        ],
      ),
    );
  }
}

class LisTileInfo extends StatelessWidget {
  final IconData icone;
  final String textListe;
  final Widget screenDesired;
  LisTileInfo(this.icone, this.textListe, this.screenDesired);
  @override
  Widget build(BuildContext context) {
    //var icone2 = icone;
    return ListTile(
      leading: Icon(icone),
      title: Text(textListe),
      onTap: () {
        //gera eventos
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => screenDesired));
      },
    );
  }
}
