
import 'dart:developer';

import 'package:destacable_inc/data/models/user.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0.0;
    for (var data in user.data) {
      totalAmount += data.amount;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Investments Distribution", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14*responsive.scaleAverage)),
        SizedBox(height: 30*responsive.scaleHeight),
        
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, 
            child: Row(
            children: user.data.map((e){
              final percentage = e.amount/totalAmount;
              return _GraphItem(percentage: percentage);
            }).toList(),
          )
          ),
        ),

        
      ],
    );
  }
}

class _GraphItem extends StatelessWidget {
  const _GraphItem({ required this.percentage});
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final customPercentage = double.parse((percentage*100).toStringAsFixed(1));
        log(customPercentage.toString());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.5*responsive.scaleWidth),
        height: 30*responsive.scaleHeight,
        width: responsive.screenWidth *percentage,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8)
        ),
      ),
    );
  }
}