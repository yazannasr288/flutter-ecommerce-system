import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Topappbarcart extends StatelessWidget {
  final String text;
  const Topappbarcart({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: () {Get.back;}, icon: Icon(Icons.arrow_back)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
