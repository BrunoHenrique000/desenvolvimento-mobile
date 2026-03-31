import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  final String nome;
  const Tela2({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nome recebido: $nome'
            ),
          ],
        )
      ),
    );
  }
}
