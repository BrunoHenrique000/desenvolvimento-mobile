import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void trocarTela() {
    Navigator.pushReplacementNamed(context, '/secundaria');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8A19D6),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Image.asset('assets/images/logonubank.png'),
          ElevatedButton(
            style: TextButton.styleFrom(minimumSize: Size(302, 51)),
            onPressed: trocarTela,
            child: Text(
              'Usar senha do celular',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: .bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
