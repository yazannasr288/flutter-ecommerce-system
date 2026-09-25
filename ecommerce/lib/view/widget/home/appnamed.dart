import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Appnamed extends StatelessWidget {
  final String textappnamed;
  const Appnamed({super.key, required this.textappnamed});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 20),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: Text(
        textappnamed,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
