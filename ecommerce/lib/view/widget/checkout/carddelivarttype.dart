import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Carddelivarttype extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isactiv;

  const Carddelivarttype({
    super.key,
    required this.imagename,
    required this.title,
    required this.isactiv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: isactiv ? AppColor.primaryColor : null,

        border: Border.all(color: AppColor.primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: 60,
            // color: isactiv ? AppColor.white : null,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isactiv == true ? AppColor.white : AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
