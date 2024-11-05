import 'package:intl/intl.dart';

class Operators {
  static String locale = 'es-CO';

  static String numberWithoutDecimal(double number) {
      var f = NumberFormat('#,##0', locale);
      return f.format(number);
    }
  
  static String formatNumberDecimal(double number) {
  if (number == number.toInt()) {
    return number.toInt().toString(); 
  } else {
    return number.toStringAsFixed(1);
  }
  }
  static String formatDate(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }
  
  static String getPercentage(double percentage) {
    final String percentageFormatted = formatNumberDecimal(double.parse((percentage*100).toStringAsFixed(1)));
    return percentageFormatted;
  }

  static int dateInMonths(DateTime startDate, DateTime endDate) {
    if (startDate.isAfter(endDate)) {
      final temp = startDate;
      startDate = endDate;
      endDate = temp;
    }

    int years = endDate.year - startDate.year;
    int month = endDate.month - startDate.month;

    if (month < 0) {
      years--;
      month += 12;
    }

    int difference = years * 12 + month;

    return difference;
  }
}
