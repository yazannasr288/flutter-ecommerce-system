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
    // استخدم const حيث يمكن داخل الديكوريشن لتعزيز الأداء
    const borderRadius = BorderRadius.all(Radius.circular(10));

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              prefixIcon: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[100],
                  fixedSize: const Size(40, 40), // زيادة الحجم لسهولة التفاعل
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: onPressediconsearch,
                child: const Icon(Icons.search, size: 22),
              ),
              suffixIcon: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[200],
                  fixedSize: const Size(40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: onPressedicondelete,
                child: const Icon(Icons.delete_forever_outlined, size: 22),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: borderRadius,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: borderRadius,
          ),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          // محتوى هذا الكونتينر غير مذكور، إذا فارغ يمكن حذفه أو تركه حسب الحاجة
        ),
      ],
    );
  }
}
