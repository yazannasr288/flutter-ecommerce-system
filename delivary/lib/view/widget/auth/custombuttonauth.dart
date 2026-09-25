import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Custombuttonauth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const Custombuttonauth({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(45), // العرض تلقائي، والارتفاع 45
        backgroundColor: AppColor.primaryColor,
        textStyle: const TextStyle(color: AppColor.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: AppColor.red),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
