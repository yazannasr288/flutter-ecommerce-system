import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Cardpaymentmethod extends StatelessWidget {
  final String title;
  final bool isactive;

  const Cardpaymentmethod({
    super.key,
    required this.title,
    required this.isactive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          height: 1,
          color: isactive == true ? AppColor.white : AppColor.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
        color: isactive == true ? AppColor.primaryColor : AppColor.white,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          left: BorderSide(color: Colors.purple),
          bottom: BorderSide(color: Colors.purple),
          top: BorderSide(color: Colors.purple),
          right: BorderSide(color: Colors.purple),
        ),
      ),
    );
  }
}
