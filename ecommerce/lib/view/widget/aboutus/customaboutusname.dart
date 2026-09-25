import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Customaboutusname extends StatelessWidget {
  final String maintext;

  const Customaboutusname({super.key, required this.maintext, });

  @override
  Widget build(BuildContext context) {

    return
      Text(
        maintext,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,letterSpacing: 1.3,color: AppColor.red
        ),

    );
  }
}
