import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Customaboutustext extends StatelessWidget {
  final String maintext;
  final String subtext;
  const Customaboutustext({super.key, required this.maintext, required this.subtext, });

  @override
  Widget build(BuildContext context) {

    return  Column( children: [Text(
      maintext,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColor,
      ),
    ),
      SizedBox(height: 8),
      Text(
        subtext,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,letterSpacing: 1.3
        ),
      ),      SizedBox(height: 10),
    ]
    );
  }
}
