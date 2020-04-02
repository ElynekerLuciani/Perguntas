import 'package:flutter/material.dart';

//classe que contém o componente texto com a pergunta selecionada
class Questao extends StatelessWidget {
  final String texto;

  //construtor
  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
                texto,
                style: TextStyle(
                        fontSize: 28),
                textAlign: TextAlign.center,
              ),
    );
  }
}