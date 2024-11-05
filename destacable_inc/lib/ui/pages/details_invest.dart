import 'package:destacable_inc/data/models/data.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class DetailsInvestPage extends StatelessWidget {
  const DetailsInvestPage({super.key});

  @override
  Widget build(BuildContext context) {

    final Data? data = 
      ModalRoute.of(context)?.settings.arguments as Data?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: data != null 
      ?SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 14*responsive.scaleHeight, left: 26*responsive.scaleWidth, right: 26*responsive.scaleWidth),
            child: Column(
              children: [
                Container(
                  width: 145*responsive.scaleWidth,
                  height: 145*responsive.scaleHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffE9FAFF),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/info.png",width: 75*responsive.scaleWidth, height: 75*responsive.scaleHeight)),
                ),
                SizedBox(height: 36*responsive.scaleHeight),
                
                Text("CDT Investment ${data.bankName}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20*responsive.scaleAverage), textAlign: TextAlign.center),
                Text("Investment by \$${data.amountFormatted} to ${data.bankName}", 
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15*responsive.scaleAverage, color: const Color(0Xff9D9D9E)), textAlign: TextAlign.center),
        
                SizedBox(height: 26*responsive.scaleHeight),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18*responsive.scaleWidth, vertical: 16*responsive.scaleHeight),
                  height: 390*responsive.scaleHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffDBDBDB)),
                  borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Detail Investment", style: TextStyle(fontSize: 14*responsive.scaleAverage, fontWeight: FontWeight.w600)),
                      SizedBox(height: 21*responsive.scaleHeight),
                      _DataRow(item: "Investment ID",value: data.id),
                      SizedBox(height: 30*responsive.scaleHeight),
                      _DataRow(item: "Invest amount",value: data.amountFormatted),
                      SizedBox(height: 30*responsive.scaleHeight),
                      _DataRow(item: "Return",value: data.roiFormatted),
                      SizedBox(height: 30*responsive.scaleHeight),
                      _DataRow(item: "Rate",value: "${data.rateFormatted}%"),
                      SizedBox(height: 30*responsive.scaleHeight),
                      _DataRow(item: "Start date",value: data.startDayFormatted),
                      SizedBox(height: 30*responsive.scaleHeight),
                      _DataRow(item: "End date",value: data.endtDayFormatted),
                      SizedBox(height: 30*responsive.scaleHeight),
                      _DataRow(item: "Return period",value: "${data.returnPeriod} months"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
      :const SizedBox()
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.item,
    required this.value
  });

  final String item;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10*responsive.scaleWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item, style: TextStyle(color: const Color(0xffA1A3A6), fontSize: 13*responsive.scaleAverage, fontWeight: FontWeight.w500),),
          SizedBox(
            width: 110*responsive.scaleWidth,
            child: Text(value, style: TextStyle(fontSize: 13*responsive.scaleAverage, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}