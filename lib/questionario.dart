import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  //construtor, com decorator @ para parâmetros obrigatorios
  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  //verifica se o tamanho da lista de perguntas eh menor
  // que a quantidade de perguntas
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map <String, Object>> respostas = temPerguntaSelecionada ? 
                perguntas[perguntaSelecionada]['respostas'] : null;
    return Column(
      children: <Widget>[
        //utilizou o novo componente da classe questao
        Questao(perguntas[perguntaSelecionada]['texto']), 
        /*os ... é um operador que pega todos os elementos de uma lista
          e coloca em uma nova lista. t são os textos*/
        /*na próxima linha: pegamos a lista de respostas (string),
          convertemos com o map a lista de string para lista de widget,
          e depois transformamos o resultado em uma nova lista */
        ...respostas.map((resp) {
          return Resposta(
                      resp['texto'], 
                      () => quandoResponder(resp['pontuacao']),
                );
        }).toList(),
      ],
    );
  }
}
