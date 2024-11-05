import 'dart:async';
import 'dart:ui';

// import 'package:destacable_inc/cubit/cubit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: _onStart,
        onBackground: _onIosBackground,
      ),
      androidConfiguration: AndroidConfiguration(
        autoStart: true,
        onStart: _onStart,
        autoStartOnBoot: true,
        isForegroundMode: false,
      ),
    );
  }

  @pragma('vm:entry-point')
  Future<bool> _onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    return true;
  }
  
  @pragma('vm:entry-point')
  void _onStart(ServiceInstance service) async{
    WidgetsFlutterBinding.ensureInitialized();
      // Timer.periodic(const Duration(seconds: 10), (timer) async {
      //   CubitProvider.instanceuser.fetchData();
      // });
  }