import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerPaciente = TextEditingController();

  final TextEditingController _controllerIdade = TextEditingController();

  File _image;
  
  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
      
      
      // String ee = Utility.base64String(_image.readAsBytesSync());
      
    });
  }

  Widget decideImageView() {
    if (_image == null) {
      return InkWell(
          onTap: () {
            getImage(true);
          },
          child: Image.asset(
            'image/default-placeholder-1-2.png',
            width: 200.0,
            height: 200.0,
          ));
    } else {
      return InkWell(
          onTap: () {
            getImage(true);
          },
          child: Image.file(
            _image,
            width: 300.0,
            height: 300.0,
          ));
    }
  }

  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Paciente'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
             decideImageView(),
            TextBox(Icons.people, 'Nome', 'Nome do Paciente', _controllerPaciente),
            TextBox(Icons.lock_outline, 'Idade', 'Idade do Paciente',_controllerIdade),
            RaisedButton(
              child: Text(
                'Confirmar',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
               final String name = _controllerPaciente.text;
                final int idade = int.tryParse(_controllerIdade.text);
                //final String ifo  = Utility.base64String(_image.readAsBytesSync());
                //final User usuario = User(2,name,int.tryParse(idade),ifo);
                /*save(usuario).then((id){
                  findAll().then((users) => debugPrint(users.toString()));
                });*/
              Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}



class TextBox extends StatelessWidget {
  final TextEditingController _controlador;
  final IconData iconformBox;
  final String spaceText;
  final String spaceSobText;
  TextBox(
      this.iconformBox, this.spaceText, this.spaceSobText, this._controlador);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: spaceText,
            hintText: spaceSobText,
            icon: Icon(iconformBox)),
      ),
    );
  }
}
