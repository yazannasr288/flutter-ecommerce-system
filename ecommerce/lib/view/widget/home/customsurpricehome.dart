import 'package:ecommerse/controler/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Customsurpricehome extends GetView<HomecontrollerImp> {
  final Widget image;

  const Customsurpricehome({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 150,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FittedBox(
          fit: BoxFit.cover,
          child: image,
        ),
      ),
    );
  }
}

