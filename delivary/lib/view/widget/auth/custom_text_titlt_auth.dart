import 'package:flutter/material.dart';

class Customtexttitltauth extends StatelessWidget {
  final String texttr;
  final TextStyle? Function(TextTheme)? themeSelector;
  final TextAlign? textAlign;
  final TextStyle? style;

  const Customtexttitltauth({
    super.key,
    required this.texttr,
    this.themeSelector,
    this.textAlign,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final baseStyle = themeSelector?.call(textTheme) ?? textTheme.displayLarge!;
    final finalStyle = style != null ? baseStyle.merge(style) : baseStyle;

    return Text(
      texttr,
      style: finalStyle,
      textAlign: textAlign,
    );
  }
}
