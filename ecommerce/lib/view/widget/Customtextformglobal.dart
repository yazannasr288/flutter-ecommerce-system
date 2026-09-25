import 'package:flutter/material.dart';

class Customtextformglobal extends StatelessWidget {
  final String hinttext;
  final String labletext;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isnumber;
  final bool obsecure;
  final bool read;
  final VoidCallback? onTapIcon;

  const Customtextformglobal({
    super.key,
    required this.hinttext,
    required this.labletext,
    this.iconData,
    this.mycontroller,
    required this.valid,
    required this.isnumber,
    this.obsecure = false,
    this.onTapIcon,
    this.read = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        readOnly: read,
        keyboardType: isnumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        obscureText: obsecure,
        controller: mycontroller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Text(labletext),
          suffixIcon: iconData != null
              ? InkWell(onTap: onTapIcon, child: Icon(iconData))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
