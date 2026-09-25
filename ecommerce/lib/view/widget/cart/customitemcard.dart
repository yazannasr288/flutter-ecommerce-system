import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/linkapi.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Customitemcard extends StatelessWidget {
  final String name;

  final String price;
 final  void Function()? onadd;
  final void Function()? onremove;
  final String count;

  final String imagename;

  const Customitemcard({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename, required this.onadd,required this.onremove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagestItems}/$imagename",
                height: 80,
              ),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                title: Text(name),
                subtitle: Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: IconButton(onPressed: onadd, icon: Icon(Icons.add)),
                  ),
                  Container(
                    child: Text(count, style: TextStyle(fontFamily: "sans")),
                  ),
                  Container(
                    height: 30,
                    child: IconButton(
                      onPressed: onremove,
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
