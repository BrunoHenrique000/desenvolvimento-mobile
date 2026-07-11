import 'package:flutter/material.dart';

Widget card({Widget? child, double width = 250, double height = 150}) {
  return Container(
    width: width,
    height: height,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: child ?? const SizedBox.shrink(),
  );
}
