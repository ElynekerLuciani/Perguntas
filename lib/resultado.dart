import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuiz;

  //construtor
  Resultado(this.pontuacao, this.quandoReiniciarQuiz);

  String get fraseResultado {
    if(pontuacao == 6) {
      return 'Tente Novamente :(';
    } else if(pontuacao >6 && pontuacao <= 19) {
      return 'Muito bom!';
    } else if(pontuacao >19 && pontuacao <= 24) {
      return 'Impressionante';
    } else {
      return 'Incrível: Nível Máximo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text(
                  fraseResultado, 
                  style: TextStyle(fontSize: 28),
                  ),
          ),
          FlatButton(
            child: Text('Reiniciar?',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
            textColor: Colors.blue,
            onPressed: quandoReiniciarQuiz,
          )
      ],
    );
  }
}