import 'package:ecommerse/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custombottonappbar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData iconData;
  final bool active ;

 const Custombottonappbar({
    super.key,
    required this.textbutton,
    required this.iconData,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primaryColor : Colors.black,size: 22,
          ),
          Text(
            textbutton,
            style: TextStyle(fontSize: 8,
              color: active == true ? AppColor.primaryColor :Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
