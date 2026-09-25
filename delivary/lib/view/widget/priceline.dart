import 'package:flutter/material.dart';

class Priceline extends StatelessWidget {
  final Widget price;
  const Priceline({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        price,
      ],
    );
  }
}
