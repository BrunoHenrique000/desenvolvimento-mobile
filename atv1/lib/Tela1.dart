import 'package:flutter/material.dart';
import 'Tela2.dart';

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 55),

          Center(
            child: Image.asset(
              'images/padrao.png',
              width: 160,
              height: 160,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'Escolha do APP',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 150),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Tela2(escolhaUsuario: 'pedra'),
                    ),
                  );
                },
                child: Image.asset(
                  'images/pedra.png',
                  width: 90,
                  height: 90,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Tela2(escolhaUsuario: 'papel'),
                    ),
                  );
                },
                child: Image.asset(
                  'images/papel.png',
                  width: 90,
                  height: 90,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Tela2(escolhaUsuario: 'tesoura'),
                    ),
                  );
                },
                child: Image.asset(
                  'images/tesoura.png',
                  width: 90,
                  height: 90,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}