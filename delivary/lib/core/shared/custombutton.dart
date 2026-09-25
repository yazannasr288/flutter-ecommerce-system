import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Custombutton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const Custombutton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 20, left: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(0, 45),
            backgroundColor: AppColor.primaryColor,
            textStyle: TextStyle(color: AppColor.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: AppColor.red),
            ),
            padding: EdgeInsets.symmetric(vertical: 5),
        ),

        onPressed: onPressed,

        child: Text(
          text,
          style: TextStyle(
            color: AppColor.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
