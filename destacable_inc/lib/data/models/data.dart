import 'dart:convert';

import 'package:destacable_inc/data/helpers/operators.dart';

class Data {
    final String id;
    final String bankName;
    final dynamic amount;
    final dynamic rate;
    final DateTime startDate;
    final DateTime endDate;
    final int roi;

    Data({
        required this.id,
        required this.bankName,
        required this.amount,
        required this.rate,
        required this.startDate,
        required this.endDate,
        required this.roi,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        bankName: json["bank_name"],
        amount: json["amount"],
        rate: json["rate"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        roi: json["roi"],
    );
    
    String get amountFormatted => Operators.numberWithoutDecimal(double.parse(amount.toString()));
    String get roiFormatted => Operators.numberWithoutDecimal(double.parse(roi.toString()));
    String get rateFormatted => Operators.formatNumberDecimal(double.parse(rate.toString()));
    String get startDayFormatted => Operators.formatDate(startDate);
    String get endtDayFormatted => Operators.formatDate(endDate);
    String get returnPeriod => Operators.dateInMonths(startDate, endDate).toString();

    Map<String, dynamic> toMap() => {
        "id": id,
        "bank_name": bankName,
        "amount": amount,
        "rate": rate,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "roi": roi,
    };
}
