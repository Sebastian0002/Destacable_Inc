import 'package:destacable_inc/data/models/data.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class CardInvest extends StatelessWidget {
  const CardInvest({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "invest_details", arguments: data);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16*responsive.scaleHeight),
        width: double.infinity,
        height: 110*responsive.scaleHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20*responsive.scaleWidth, vertical: 5*responsive.scaleHeight),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Amount", style: TextStyle(fontSize: 14*responsive.scaleAverage),),
                      Text("\$${data.amountFormatted}", style: TextStyle(fontSize: 20*responsive.scaleAverage, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rate", style: TextStyle(fontSize: 14*responsive.scaleAverage),),
                      Text("${data.rateFormatted}%", style: TextStyle(fontSize: 20*responsive.scaleAverage, fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Return", style: TextStyle(fontSize: 14*responsive.scaleAverage),),
                      Text("\$${data.roiFormatted}", style: TextStyle(fontSize: 20*responsive.scaleAverage, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.bankName, style: TextStyle(fontSize: 14*responsive.scaleAverage),),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}