import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSeguro extends StatelessWidget {
  final IconData icon;
  final String title;

  const CardSeguro({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F1F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black, size: 22),
              const SizedBox(width: 14),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF060606),
                ),
              ),
            ],
          ),
          Text(
            'Conhecer',
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF830AD1),
            ),
          ),
        ],
      ),
    );
  }
}
