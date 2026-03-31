import 'package:flutter/material.dart';
import 'dart:math';

class Tela2 extends StatelessWidget {
  final String escolhaUsuario;

  Tela2({required this.escolhaUsuario});

  @override
  Widget build(BuildContext context) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var random = Random();
    var escolhaApp = opcoes[random.nextInt(3)];

    String resultado;

    if (escolhaUsuario == escolhaApp) {
      resultado = 'Empate';
    } else if (
    (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      resultado = 'Você ganhou!';
    } else {
      resultado = 'Você perdeu!';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),

          Center(
            child: Image.asset(
              'images/$escolhaApp.png',
              width: 150,
              height: 150,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Escolha do APP',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 45),

          Center(
            child: Image.asset(
              'images/$escolhaUsuario.png',
              width: 150,
              height: 150,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Sua Escolha',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          const SizedBox(height: 15),

          Text(
            resultado,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Jogar novamente',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}