import 'dart:io';

final String ipAddress = Platform.isAndroid ? "192.168.1.3" : "localhost";
final String api = "http://$ipAddress:3000/api";
// const String api = "http://192.168.1.3:3000/api";
