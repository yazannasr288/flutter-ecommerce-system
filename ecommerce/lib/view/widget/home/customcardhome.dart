import 'package:ecommerse/controler/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class Customcardhome extends GetView<HomecontrollerImp> {
  final String title;
  final String body;


  const Customcardhome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),

      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                body,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,

              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
