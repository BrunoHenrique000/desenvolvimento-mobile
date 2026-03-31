import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  DateTime? dataNascimento;
  bool aceitaTermos = false;
  bool receberNotificacoes = false;
  String? estadoCivil;

  Future<void> selecionarData() async {
    DateTime? dataEscolhida = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (dataEscolhida != null) {
      setState(() {
        dataNascimento = dataEscolhida;
      });
    }
  }

  String mostrarData() {
    if (dataNascimento == null) {
      return 'Nenhuma data selecionada';
    }

    return '${dataNascimento!.day}/${dataNascimento!.month}/${dataNascimento!.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Cadastro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: selecionarData,
              child: const Text('Selecionar Data de Nascimento'),
            ),
            const SizedBox(height: 10),
            Text(mostrarData()),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Aceita os termos?'),
                Checkbox(
                  value: aceitaTermos,
                  onChanged: (valor) {
                    setState(() {
                      aceitaTermos = valor ?? false;
                    });
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Receber notificações?'),
                Switch(
                  value: receberNotificacoes,
                  onChanged: (valor) {
                    setState(() {
                      receberNotificacoes = valor;
                    });
                  },
                ),
              ],
            ),

            DropdownButton<String>(
              hint: const Text('Estado Civil'),
              value: estadoCivil,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Solteiro(a)',
                  child: Text('Solteiro(a)'),
                ),
                DropdownMenuItem(
                  value: 'Casado(a)',
                  child: Text('Casado(a)'),
                ),
                DropdownMenuItem(
                  value: 'Divorciado(a)',
                  child: Text('Divorciado(a)'),
                ),
                DropdownMenuItem(
                  value: 'Viúvo(a)',
                  child: Text('Viúvo(a)'),
                ),
              ],
              onChanged: (valor) {
                setState(() {
                  estadoCivil = valor;
                });
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print('Nome: ${nomeController.text}');
                print('Idade: ${idadeController.text}');
                print('Data: ${mostrarData()}');
                print('Aceita termos: $aceitaTermos');
                print('Receber notificações: $receberNotificacoes');
                print('Estado civil: $estadoCivil');
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}