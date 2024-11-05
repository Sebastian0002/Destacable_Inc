import 'package:destacable_inc/ui/pages/select_user/widgets/card_user.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class SelectUserPage extends StatelessWidget {
  const SelectUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CardUserProperties card1 = CardUserProperties(userId: "1244", color: const Color(0xffDEDCFF));
    final CardUserProperties card2 = CardUserProperties(userId: "1255", color: const Color(0xffB0EDFF));
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: responsive.screenWidth,
          height: responsive.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 123*responsive.scaleHeight, left: 31*responsive.scaleWidth),
                child: const Text(
                  "Select\nUser to consult", 
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start),
              ),
              SizedBox(height: 71*responsive.scaleHeight),
              CardUser(
                color: card1.color,
                title: "User1", 
                subtitle: "ID: ${card1.userId}",
                onTap: () {
                  Navigator.pushNamed(context, 'home', arguments: card1);
                },
              ),
              SizedBox(height: 20*responsive.scaleHeight),
              CardUser(
                color: card2.color,
                title: "User2", 
                subtitle: "ID: ${card2.userId}",
                onTap: () {
                  Navigator.pushNamed(context, 'home', arguments: card2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CardUserProperties{
  final String userId;
  final Color color;
  CardUserProperties({required this.userId, required this.color});

}
