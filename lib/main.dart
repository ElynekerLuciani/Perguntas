import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

/* essa classe fica responsável por receber o nome do 
* componente com estado que queremos gerenciar.
*/
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0; //estado
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?',
        'respostas': [
                  {'texto': 'Vermelho', 'pontuacao':10}, 
                  {'texto': 'Preto', 'pontuacao': 5},
                  {'texto': 'Azul', 'pontuacao': 3},
                  {'texto': 'Branco', 'pontuacao': 1},
                  ],
      },
      {
        'texto': 'Qual seu animal favorito?',
        'respostas': [
                  {'texto': 'Coelho', 'pontuacao': 10}, 
                  {'texto': 'Cachorro', 'pontuacao': 5}, 
                  {'texto': 'Gato', 'pontuacao'   : 3},  
                  {'texto': 'Leão','pontuacao': 1},
                  ],
      },
      {
        'texto': 'Qual seu instrutor favorito?',
        'respostas': [
                  {'texto': 'Maria', 'pontuacao': 4 },
                  {'texto': 'João',  'pontuacao': 7},
                  {'texto': 'Pedro', 'pontuacao': 9},
                  {'texto': 'Leo', 'pontuacao': 10}
                  ],
      }
    ];

  //método que vai manipular o valor do estado
  void _responder(int pontuacao) {
    if(temPerguntaSelecionada) {
      //notificar a interface quando houver uma mudança
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal+= pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  /*  função build é a árvore de componentes e 
   * depende do estado da aplicação para ser renderizada
   */
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            appBar: AppBar(
                    title: Text('Perguntas'),
                    ),
            body: temPerguntaSelecionada ? 
                Questionario( 
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                )
                :Resultado(_pontuacaoTotal, _reiniciarQuiz),
          ),
    );
  }
}

//classe que contém o componentes stateful (estado)
class PerguntaApp extends StatefulWidget {
  //cria o estado no componente
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
