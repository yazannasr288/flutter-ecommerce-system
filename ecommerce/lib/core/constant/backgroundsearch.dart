import 'package:flutter/material.dart';

class Backgroundsearch extends StatelessWidget {
  const Backgroundsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFCAC7F1), // بنفسجي موحد
                Color(0xFFCAC7F1),
                Color(0xFFCAC7F1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
