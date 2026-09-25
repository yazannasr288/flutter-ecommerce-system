import 'package:flutter/cupertino.dart';


class Topcardcart extends StatelessWidget {
  final String massage;
  const Topcardcart({super.key, required this.massage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        massage,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
