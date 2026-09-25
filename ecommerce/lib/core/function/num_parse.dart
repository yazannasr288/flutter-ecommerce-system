extension ParseToDouble on String? {
  /// يحوّل النص إلى double بعد:
  /// - استبدال الفاصلة العربية "،" أو الفاصلة العادية "," بنقطة "."
  /// - إزالة أي مسافات زائدة
  /// إذا فشل التحويل ترجع القيمة الافتراضية defaultValue أو null.
  double? toDouble({double? defaultValue}) {
    if (this == null) return defaultValue;
    final normalized = this!
        .replaceAll(',', '.')         // 10,50 → "10.50"
        .replaceAll(RegExp(r'\s+'), '') // يحذف أي مسافات داخل السلسلة
        .trim();
    final parsed = double.tryParse(normalized);
    return parsed ?? defaultValue;
  }
}