import 'package:flutter/material.dart';

class CustomTextSignupOrSignup extends StatelessWidget {
  final Widget textone;
  final Widget textwo;
  final void Function() ontap;

  const CustomTextSignupOrSignup({
    super.key,
    required this.textone,
    required this.textwo,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textone,
        const SizedBox(width: 5), // حذف height لأنه لا يؤثر في Row
        InkWell(onTap: ontap, child: textwo),
      ],
    );
  }
}
