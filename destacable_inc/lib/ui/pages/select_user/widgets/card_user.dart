import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    this.onTap
    });

  final Color color;
  final String title;
  final String subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 33),
        width: double.infinity,
        height: 155*responsive.scaleHeight,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22*responsive.scaleWidth),
              child: SizedBox(
                width: 83*responsive.scaleWidth,
                height: 79*responsive.scaleHeight,
                child: Image.asset("assets/images/boy.png")),
            ),
            SizedBox(width: 15*responsive.scaleWidth),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 24*responsive.scaleAverage, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(left: 30*responsive.scaleWidth),
                  child: Text(subtitle, style: TextStyle(fontSize: 15*responsive.scaleAverage, fontWeight: FontWeight.w400),),
                )
              ],
            ),
            SizedBox(width: 75*responsive.scaleWidth),
            Container(
              width: 30*responsive.scaleWidth,
              height: 30*responsive.scaleWidth,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(100)
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded, size: 20))
          ],
        ),
      ),
    );
  }
}