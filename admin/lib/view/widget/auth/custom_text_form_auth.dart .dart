import 'package:flutter/material.dart';

class Customtextformauth extends StatelessWidget {
  final String hinttext;
  final String labletext;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isnumber;
  final bool? obsecure;
  final void Function()? onTapIcon;

  const Customtextformauth({
    super.key,
    required this.hinttext,
    required this.labletext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isnumber,
    this.obsecure = false,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        keyboardType: isnumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        obscureText: obsecure ?? false,
        controller: mycontroller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Text(labletext),
          suffixIcon: onTapIcon == null
              ? null
              : InkWell(
            onTap: onTapIcon,
            child: Icon(iconData),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
