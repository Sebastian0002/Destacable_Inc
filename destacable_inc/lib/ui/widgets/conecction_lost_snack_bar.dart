import 'package:destacable_inc/main.dart';
import 'package:flutter/material.dart';

void showGlobalSnackBarLostConnection() {
  scaffoldMessengerKey.currentState?.showSnackBar(
    const SnackBar(
      content: Center(child: Text("Lost connection, check your network", style: TextStyle(fontWeight: FontWeight.w600),)),
      duration: Duration(seconds: 3),
    ),
  );
}