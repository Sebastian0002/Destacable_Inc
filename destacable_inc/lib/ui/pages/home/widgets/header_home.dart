
import 'package:destacable_inc/data/models/user.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class HeaderDataUser extends StatelessWidget {
  const HeaderDataUser(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5*responsive.scaleHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Investment", 
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14*responsive.scaleAverage)),
            Text(
              "Hi, Jhoann", 
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15*responsive.scaleAverage)),
          ],
        ),
        Text(
          "\$100.000.000", 
          style: TextStyle(fontSize: 36*responsive.scaleAverage, fontWeight: FontWeight.w500)),
        
        Text(
          "Total Return", 
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14*responsive.scaleAverage)),
        Text(
          "\$150.000.000", 
          style: TextStyle(fontSize: 36*responsive.scaleAverage, fontWeight: FontWeight.w500)),
      ],
    );
  }
}