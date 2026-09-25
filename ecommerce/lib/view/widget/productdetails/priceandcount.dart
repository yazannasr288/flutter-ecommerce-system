import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class Priceandcount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final Widget price;
  final String count;

  const Priceandcount({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.topCenter,
              width: 50,
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColor.black),
              ),
              child: Text(count, style: TextStyle(fontSize: 20, height: 1.1)),
            ),
            IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        price,
      ],
    );
  }
}
