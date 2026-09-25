import 'package:flutter/material.dart';

class Cardadmin extends StatelessWidget {
  final String title;

  final String url;

  final void Function()? onclick;

  const Cardadmin({
    super.key,
    required this.title,
    required this.url,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(url, width: 90), Text(title)],
        ),
      ),
    );
  }
}
