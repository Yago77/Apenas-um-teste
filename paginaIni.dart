import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testte/controlador.dart';
import 'package:testte/dados.dart';

class Pagina extends StatefulWidget {
  const Pagina({Key? key}) : super(key: key);

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  List<Dados> teste = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  buildBody() {
    return ListView.builder(
        itemCount: teste.length,
        itemBuilder: (context, index) {
          return buildItem(index);
        });
  }

  buildItem(index) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Text("${teste[index].titulo}",style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${teste[index].descricao}",),
            Image.asset("${teste[index].image}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.thumb_up_alt_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.comment_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
                IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        Dados dados =
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Controlador();
        }));

        setState(() {
          teste.add(dados);
        });
      },
      child: Icon(Icons.add),
    );
  }
}
