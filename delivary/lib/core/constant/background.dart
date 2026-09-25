import 'package:flutter/material.dart';

class GradientWaveBackground extends StatelessWidget {
  const GradientWaveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // التدرّج اللوني من الأعلى إلى الأسفل
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF7B61FF), // لون بنفسجي داكن
                  Color(0xFFCBC6FB), //
// لون بنفسجي فاتح
                ],
              ),
            ),
          ),

          // طبقة الانحناءة البيضاء
          ClipPath(
            clipper: _BottomWaveClipper(),
            child: Container(
             color:  Color(0xFFC9C9F4), // لون بنفسجي فاتح
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // نرسم منحنى يبدأ من يسار العرض عند ارتفاع معيّن
    path.lineTo(0, size.height * 0.75);

    // منحنى بيزير رباعي للتحكّم في الانحناء
    path.quadraticBezierTo(
      size.width * 0.55, // نقطة التحكم الأفقية (منتصف العرض)
      size.height * 0.65, // ارتفاع قمة المنحنى
      size.width ,        // نهاية المنحنى على اليمين
      size.height * 0.75,
    );

    // ثم ننزل إلى أسفل اليمين واليسار ونغلق المسار
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
