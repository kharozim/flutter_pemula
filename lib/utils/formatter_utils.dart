import 'package:intl/intl.dart';

class FormatterUtils {
  static String convertToIdr(dynamic number, {int decimalDigit = 0}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
