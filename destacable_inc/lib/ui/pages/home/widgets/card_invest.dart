import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class CardInvest extends StatelessWidget {
  const CardInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16*responsive.scaleHeight),
      width: double.infinity,
      height: 110*responsive.scaleHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}