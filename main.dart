import 'package:flutter/material.dart';
import 'package:testte/controlador.dart';
import 'package:testte/paginaIni.dart';

main() => runApp(Teste());

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pagina(),
    );
  }
}
