import 'package:flutter/material.dart';

class CustomTextSignupOrSignup extends StatelessWidget {
  final Widget textOne;
  final Widget textTwo;
  final VoidCallback ontap;

  const CustomTextSignupOrSignup({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textOne,
        const SizedBox(width: 5),
        InkWell(
          onTap: ontap,
          child: textTwo,
        ),
      ],
    );
  }
}
