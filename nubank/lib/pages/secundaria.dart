import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank/models/carteira.dart';
import 'package:nubank/models/usuario.dart';
import 'package:nubank/widgets/cardPersonalizado.dart';
import 'package:nubank/widgets/cardSeguro.dart';
import 'package:nubank/widgets/cardDescubra.dart';

class Secundaria extends StatefulWidget {
  const Secundaria({super.key});

  @override
  State<Secundaria> createState() => _SecundariaState();
}

class _SecundariaState extends State<Secundaria> {
  // inicializa a carteira com os parâmetros saldo, fatura, limite e emprestimo
  final Carteira _carteira = Carteira(1356.98, 250, 3455.55, 25000);
  late final Usuario _usuario = Usuario('Bruno', 30, _carteira);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4F9),
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: const Color(0xFF830AD1),
        elevation: 0,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9B03FE),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_outlined, color: Colors.white),
                ),
                SizedBox(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/iconevisualizacao.png'),
                      Image.asset('assets/images/iconeajuda.png'),
                      Image.asset('assets/images/iconeconvite.png'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Olá, ${_usuario.nome}',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // conta e meus Cartões
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Conta',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF060606),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF666666),
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'R\$ ${_usuario.carteira.saldo.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF060606),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 96,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _acao('Área Pix', 'assets/images/icone.png'),
                        _acao('Pagar', 'assets/images/iconeBarras.png'),
                        _acao(
                          'Pegar\nemprestado',
                          'assets/images/iconeEmprestimo.png',
                        ),
                        _acao(
                          'Transferir',
                          'assets/images/iconeTransferencia.png',
                        ),
                        _acao('Depositar', 'assets/images/iconeDeposito.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE7F2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.credit_card, color: Colors.black),
                        const SizedBox(width: 8),
                        Text(
                          'Meus cartões',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // cards horizontais
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  card(
                    width: 215,
                    height: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Você tem até',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF060606),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'R\$ ${_usuario.carteira.emprestimo.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF9B03FE),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'disponíveis para empréstimo.',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  card(
                    width: 200,
                    height: 125,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Salve seus amigos da burocracia.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF060606),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Faça um convite…',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF6E5AFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // verticais: cartão de crédito, empréstimo e investimentos
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  // card de crédito
                  _buildVerticalCard(
                    title: 'Cartão de crédito',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fatura atual',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF666666),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'R\$ ${_usuario.carteira.fatura.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF060606),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Limite disponível de R\$ ${_usuario.carteira.limite.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF666666),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F1F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Parcelar compras',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF060606),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // card empréstimo
                  _buildVerticalCard(
                    title: 'Empréstimo',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valor disponível de até',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF666666),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'R\$ ${_usuario.carteira.emprestimo.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF060606),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // card investimentos
                  _buildVerticalCard(
                    title: 'Investimentos',
                    child: Text(
                      'O jeito Nu de investir: sem asteriscos, linguagem fácil e a partir de R\$1. Saiba mais.',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Color(0xFFEDEDED),
                height: 32,
                thickness: 1,
              ),
            ),

            // seção seguros
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seguros',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF060606),
                    ),
                  ),
                  Text(
                    'Proteção para você cuidar do que importa',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CardSeguro(
                    icon: Icons.favorite_border,
                    title: 'Seguro vida',
                  ),
                  const CardSeguro(
                    icon: Icons.phone_android_outlined,
                    title: 'Seguro celular',
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Color(0xFFEDEDED),
                height: 32,
                thickness: 1,
              ),
            ),

            // seção shopping
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shopping',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF060606),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color(0xFF666666),
                      ),
                    ],
                  ),
                  Text(
                    'Vantagens exclusivas das nossas marcas preferidas',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Color(0xFFEDEDED),
                height: 32,
                thickness: 1,
              ),
            ),

            // seção descubra mais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Descubra mais',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF060606),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16, bottom: 32),
              child: const Row(
                children: [
                  CardDescubra(
                    imagePath: 'assets/images/descubraParcelas.png',
                    title: 'Parcele compras no app',
                    description:
                        'Descontos em compras à vista no crédito, controle total sobr...',
                    buttonText: 'Conhecer',
                  ),
                  CardDescubra(
                    imagePath: 'assets/images/descubraPortabilidade.png',
                    title: 'Portabilidade de salário',
                    description:
                        'Sua liberdade financeira começa com você escolhend...',
                    buttonText: 'Conhecer',
                  ),
                  CardDescubra(
                    imagePath: 'assets/images/descubraIndique.png',
                    title: 'Indique seus amigos',
                    description:
                        'Mostre aos seus amigos como é fácil ter uma vida sem ...',
                    buttonText: 'Indicar amigos',
                  ),
                  CardDescubra(
                    imagePath: 'assets/images/descubraWhatsapp.png',
                    title: 'WhatsApp',
                    description:
                        'Pagamentos seguros, rápidos e sem tarifa. A experiência ...',
                    buttonText: 'Quero conhecer',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // função para não repetir a estrutura de card vertical com cabeçalho e seta
  Widget _buildVerticalCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF060606),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF666666),
              ),
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _acao(String label, String iconPath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/Ellipse.png'),
              Image.asset(iconPath),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
