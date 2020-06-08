import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_proex/Database/app_database.dart';
import 'package:mobile_proex/modelos/user.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerPaciente = TextEditingController();

  final TextEditingController _controllerIdade = TextEditingController();

  File _image;
  final _picker = ImagePicker();
  bool _inProcess = false;

  Future getImages(bool isCamera) async {
    PickedFile image;
    if (isCamera) {
      image = await _picker.getImage(source: ImageSource.camera);
    } else {
      image = await _picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      final File file = File(image.path);
      _image = file;

      // String ee = Utility.base64String(_image.readAsBytesSync());
    });
  }

  Future getImageWid(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    final _picker = ImagePicker();
    PickedFile imageModura;
    imageModura = await _picker.getImage(source: source);
    final File newimage = File(imageModura.path);
    if (newimage != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: newimage.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxHeight: 200,
          maxWidth: 200,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.green,
            toolbarTitle: "Imagem de usuario",
            statusBarColor: Colors.white,
            backgroundColor: Colors.white,
          ));
      this.setState(() {
        _image = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  Widget decideImageView() {
    if (_image == null) {
      return InkWell(
          onTap: () {
            return getImageWid(ImageSource.gallery);
          },
          child: Image.asset(
            'image/default-placeholder-1-2.png',
            width: 200.0,
            height: 200.0,
          ));
    } else {
      return InkWell(
          onTap: () {
            return getImageWid(ImageSource.camera);
          },
          child: Image.file(
            _image,
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ));
    }
  }

  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Paciente'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                decideImageView(),
                TextBox(Icons.people, 'Nome', 'Nome do Paciente',
                    _controllerPaciente),
                TextBox(Icons.lock_outline, 'Idade', 'Idade do Paciente',
                    _controllerIdade),
                RaisedButton(
                  child: Text(
                    'Confirmar',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    final String name = _controllerPaciente.text;
                    final int idade = int.tryParse(_controllerIdade.text);
                    final String ifo =
                        Utility.base64String(_image.readAsBytesSync());
                    final User usuario = User(2, name, idade, ifo);
                    save(usuario).then((id) {
                      findAll().then((users) => null);
                    });
                    Navigator.pop(context);
                  },
                )
                
              ],
            ),
   
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
