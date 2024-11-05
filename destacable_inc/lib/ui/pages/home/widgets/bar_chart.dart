import 'package:destacable_inc/data/helpers/operators.dart';
import 'package:destacable_inc/data/models/data.dart';
import 'package:destacable_inc/data/models/user.dart';
import 'package:destacable_inc/ui/pages/home/helpers/color_chart.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
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
              return _GraphItem(user: user, data: e,);
            }).toList(),
          )
          ),
        ),

        
      ],
    );
  }
}

class _GraphItem extends StatefulWidget {
  const _GraphItem({ required this.user, required this.data });
  final User user;
  final Data data;

  @override
  State<_GraphItem> createState() => _GraphItemState();
}

class _GraphItemState extends State<_GraphItem> {
  bool isVisiblePercentage = false;
  @override
  Widget build(BuildContext context) {
    final percentage = widget.data.amount/widget.user.totalAmount;
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1.5*responsive.scaleWidth),
              height: 30*responsive.scaleHeight,
              width: responsive.screenWidth *percentage,
              decoration: BoxDecoration(
                  color: ColorChart.getColorForValue(double.parse(widget.data.amount.toString()), double.parse(widget.user.data[0].amount.toString())),
                  borderRadius: BorderRadius.circular(8)
              )
            ),
            SizedBox(height: 5*responsive.scaleHeight,),
            Row(
              children: [
                Container(
                  height: 18*responsive.scaleHeight,
                  width: 18*responsive.scaleWidth,
                  decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
                SizedBox(width: 3*responsive.scaleWidth),
                Text("${Operators.getPercentage(percentage)}%", style: TextStyle(fontSize: 11*responsive.scaleAverage, fontWeight: FontWeight.w500)),
                SizedBox(width: 5*responsive.scaleWidth),
    
              ],
            ),
          ],
        )
      ],
    );
  }
}