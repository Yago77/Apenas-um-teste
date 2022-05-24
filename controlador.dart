import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testte/dados.dart';
import 'package:image_picker/image_picker.dart';

class Controlador extends StatefulWidget {
  const Controlador({Key? key}) : super(key: key);

  @override
  State<Controlador> createState() => _ControladorState();
}

class _ControladorState extends State<Controlador> {
  File? image;

  get source => null;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporaria = File(image.path);
      setState(() => this.image = imageTemporaria);
    } on PlatformException catch (e) {
      print('Failed: $e');
    }
  }

  TextEditingController edtTitulo = TextEditingController();
  TextEditingController edtDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teste controller/ navigator"),
        ),
        body: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      child: Card(
        child: (Container(
          child: Column(
            children: [
              TextField(
                controller: edtTitulo,
              ),
              Container(
                  child: image != null
                      ? Image.file(image!)
                      : Icon(Icons.add_box_outlined, size: 120)),
              TextButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  child: Text("Coloque sua foto")),
              TextField(
                controller: edtDescricao,
              ),
              Container(
                child: Text("Teste!"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,
                        Dados(edtTitulo.text, edtDescricao.text, image));
                  },
                  child: Text("APERTA"))
            ],
          ),
        )),
      ),
    );
  }
}
