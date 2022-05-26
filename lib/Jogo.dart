import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  //logica
  var _imagePadrao = const AssetImage("images/question.png");
  var resultado = "Escolha uma opção abaixo";

  //metodo de escolha do usuario
  void opcaoSelecionada(String userEscolha) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaDoApp = opcoes[numero];

    //exibindo a imagem que o app escolheu

    switch (escolhaDoApp) {
      case "pedra":
        setState(() {
          _imagePadrao = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagePadrao = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagePadrao = const AssetImage("images/tesoura.png");
        });
        break;
      default:
        _imagePadrao = const AssetImage("images/question.png");
    }

    //fazendo a validação do resultado usuario ganha

    if ((userEscolha == "pedra" && escolhaDoApp == "tesoura") ||
        (userEscolha == "tesoura" && escolhaDoApp == "papel") ||
        (userEscolha == "papel" && escolhaDoApp == "pedra")) {
      setState(() {
        resultado = "VOCÊ GANHOU!!!";
      });

//escolha do app ganhandor
    } else if ((escolhaDoApp == "pedra" && userEscolha == "tesoura") ||
        (escolhaDoApp == "tesoura" && userEscolha == "papel") ||
        (escolhaDoApp == "papel" && userEscolha == "pedra")) {
      setState(() {
        resultado = "VOCÊ PERDEU!!";
      });
    } else {
      setState(() {
        resultado = "EMPATE!!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Escolha da IA",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //IMAGEM DECLARADA DESSE FORMA POIS A MESMA IRÁ SER ALTERADA EM TEMPO DE EXECUÇÃO DO APP
              Image(
                image: _imagePadrao,
                width: 150,
              ),

              Text(
                resultado,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: resultado == ("VOCÊ PERDEU!!")
                      ? Colors.red
                      : Colors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => //função anonima por causa do void
                        opcaoSelecionada("pedra"), //passando paramentro
                    child: Image.asset(
                      "images/pedra.png",
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        opcaoSelecionada("papel"), //passando paramentro
                    child: Image.asset(
                      "images/papel.png",
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        opcaoSelecionada("tesoura"), //passando paramentro
                    child: Image.asset(
                      "images/tesoura.png",
                      width: 100,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
