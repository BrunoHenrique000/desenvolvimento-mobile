import 'package:flutter/material.dart';
import 'confirmacao_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();

  String? sexoSelecionado;
  bool termosAceitos = false;

  final FocusNode idadeFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();

  void validarCampos() {
    String nome = nomeController.text;
    String idadeText = idadeController.text;
    String email = emailController.text;

    int? idade;

    try {
      idade = int.parse(idadeText);
    } catch (e) {
      idade = null;
    }

    if (nome.isEmpty) {
      mostrarErro("Nome inválido");
      return;
    }

    if (idade == null || idade < 18) {
      mostrarErro("Idade inválida (mínimo 18)");
      return;
    }

    if (email.isEmpty || !email.contains("@") || !email.contains(".")) {
      mostrarErro("Email inválido");
      return;
    }

    if (sexoSelecionado == null) {
      mostrarErro("Selecione o sexo");
      return;
    }

    if (!termosAceitos) {
      mostrarErro("Aceite os termos");
      return;
    }

    // Navegação
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmacaoPage(
          nome: nome,
          idade: idade!,
          email: email,
          sexo: sexoSelecionado!,
          termos: termosAceitos,
        ),
      ),
    );
  }

  void mostrarErro(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Preencha os campos abaixo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // Nome
                TextField(
                  controller: nomeController,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).requestFocus(idadeFocus),
                  decoration: InputDecoration(
                    hintText: "Nome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Idade
                TextField(
                  controller: idadeController,
                  focusNode: idadeFocus,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).requestFocus(emailFocus),
                  decoration: InputDecoration(
                    hintText: "Idade",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Email
                TextField(
                  controller: emailController,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Dropdown
                DropdownButtonFormField<String>(
                  value: sexoSelecionado,
                  hint: const Text("Selecione o sexo"),
                  items: ["Masculino", "Feminino", "Outro"]
                      .map((sexo) => DropdownMenuItem(
                    value: sexo,
                    child: Text(sexo),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      sexoSelecionado = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                // Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: termosAceitos,
                      onChanged: (value) {
                        setState(() {
                          termosAceitos = value!;
                        });
                      },
                    ),
                    const Text("Aceito os termos de uso")
                  ],
                ),

                const SizedBox(height: 20),

                // Botão
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: validarCampos,
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}