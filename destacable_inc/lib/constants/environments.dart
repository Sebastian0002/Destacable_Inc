import 'dart:io';

final String ipAddress = Platform.isAndroid ? "YOUR_IP" : "localhost";
final String api = "http://$ipAddress:3000/api";