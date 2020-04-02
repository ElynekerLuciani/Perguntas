import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resp;
  final void Function() selecionado;

  //construtor
  Resposta(this.resp, this.selecionado);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(resp),
                onPressed: selecionado,
              ),
    );
  }



}

