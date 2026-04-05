import 'package:flutter/material.dart';

class ConfirmacaoPage extends StatelessWidget {
  final String nome;
  final int idade;
  final String email;
  final String sexo;
  final bool termos;

  const ConfirmacaoPage({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.termos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmação"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: $nome"),
            Text("Idade: $idade"),
            Text("Email: $email"),
            Text("Sexo: $sexo"),
            Text("Termos: ${termos ? "Sim" : "Não"}"),

            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Voltar"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Editar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}