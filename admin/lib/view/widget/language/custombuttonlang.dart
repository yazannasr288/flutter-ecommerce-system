import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;

  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
          onPressed: onPressed,
          child: Text(
            textbutton,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
