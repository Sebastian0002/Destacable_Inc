import 'package:destacable_inc/cubit/cubit_provider.dart';
import 'package:destacable_inc/data/services/background_fetch_service.dart';
import 'package:destacable_inc/ui/pages/pages.dart';
import 'package:destacable_inc/ui/theme/theme_data.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => CubitProvider.instanceuser),
      BlocProvider(create: (_) => CubitProvider.instanceconnect),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    responsive.initResponsive(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeDataCustom.customData,
      initialRoute: "select_user",
      routes: {
        "init" : (_) => const InitPage(),
        "select_user" : (_) => const SelectUserPage(),
        "home" : (_) => const HomePage()
      },
    );
  }
}
