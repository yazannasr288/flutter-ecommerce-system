import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  final String titleappbar;
  final void Function(String)? onChanged;
  final void Function()? onPressediconsearch;
  final void Function()? onPressedicondelete;
  final TextEditingController mycontroller;

  const Customappbar({
    super.key,
    required this.titleappbar,
    this.onPressediconsearch,
    required this.onPressedicondelete,
    this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              prefixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(Icons.search, size: 22, color: Colors.green[700]),
                onPressed: onPressediconsearch,
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(Icons.delete_forever_outlined, size: 22, color: Colors.red[400]),
                onPressed: onPressedicondelete,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 10),
        // إزالة ال Container الفارغ لأنه لا يحتوي شيء مفيد حالياً
      ],
    );
  }
}
