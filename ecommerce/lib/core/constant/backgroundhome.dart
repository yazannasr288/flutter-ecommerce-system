import 'package:flutter/material.dart';

class Backgroundhome extends StatelessWidget {
  const Backgroundhome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF231D55),
              Color(0xFF4436AC),
              Color(0xFFFFFFFF),
            ],
            stops: [
              0.22,
              0.5,
              1.0,
            ],
          ),
        ),
      ),
    );
  }
}
