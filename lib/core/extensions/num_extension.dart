import 'package:intl/intl.dart';

// Extension cho kiểu num (int hoặc double)
extension NumCurrencyFormat on num? {
  String get toCurrencyFormat {
    if (this == null)
      return '0'; // Trường hợp nếu num là null, trả về chuỗi rỗng

    double value = this!.toDouble(); // Chuyển đổi num sang double nếu cần
    // Kiểm tra xem số có phần thập phân không
    if (value == value.toInt()) {
      // Nếu không có phần thập phân, chỉ cần hiển thị số nguyên
      final NumberFormat format = NumberFormat('#,###');
      return format.format(value.toInt());
    } else {
      // Nếu có phần thập phân, hiển thị phần thập phân
      final NumberFormat format = NumberFormat('#,###,##0.0#');
      return format.format(value);
    }
  }
}
