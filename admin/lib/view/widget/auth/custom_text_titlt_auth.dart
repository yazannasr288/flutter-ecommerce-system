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
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle baseStyle =
        themeSelector?.call(textTheme) ?? textTheme.displayLarge!;
    final TextStyle finalStyle = baseStyle.copyWith(
      color: style?.color,
      fontSize: style?.fontSize,
      fontWeight: style?.fontWeight,
      fontStyle: style?.fontStyle,
      letterSpacing: style?.letterSpacing,
      wordSpacing: style?.wordSpacing,
      height: style?.height,
      fontFamily: style?.fontFamily,
      backgroundColor: style?.backgroundColor,
      decoration: style?.decoration,
      overflow: style?.overflow,
    );

    return Text(
      texttr,
      style: finalStyle,
      textAlign: textAlign,
    );
  }
}
