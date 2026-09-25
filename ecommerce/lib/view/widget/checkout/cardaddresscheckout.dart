import 'package:ecommerse/core/constant/color.dart';
import 'package:flutter/material.dart';

class Cardaddresscheckout extends StatelessWidget {
  final String title;

  // final String? body;
  final bool isactive;

  const Cardaddresscheckout({
    super.key,
    required this.title,
    // this.body,
    required this.isactive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactive ? AppColor.primaryColor : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: isactive ? AppColor.white : null,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          // subtitle: Text(
          //   body!,
          //   style: TextStyle(
          //     color: isactive ? AppColor.white : null,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ),
      ),
    );
  }
}
