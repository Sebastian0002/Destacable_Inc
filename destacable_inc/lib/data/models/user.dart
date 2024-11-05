import 'package:destacable_inc/data/helpers/operators.dart';
import 'package:destacable_inc/data/models/data.dart';

import 'dart:convert';

class User {
    final List<Data> data;
    final String userId;
    User({
        required this.data,
        required this.userId,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
        userId: json["user_id"],
    );
    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "user_id": userId,
    };

    double get totalAmount {
      double tempAmount = 0.0;
      for (var data in data) {
        tempAmount += data.amount;
      }
      return tempAmount;
    } 
    String get totalAmountFormatted => Operators.numberWithoutDecimal(totalAmount);
    
    double get totalReturn {
      double tempReturn = 0.0;
      for (var data in data) {
        tempReturn += data.roi;
      }
      return tempReturn;
    } 
    String get totalReturnFormatted => Operators.numberWithoutDecimal(totalReturn);
}
