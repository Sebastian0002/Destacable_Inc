import 'package:destacable_inc/cubit/connectivity/connectivity_cubit.dart';
import 'package:destacable_inc/cubit/user/user_cubit.dart';
import 'package:destacable_inc/data/services/background_fetch_service.dart';
import 'package:destacable_inc/data/services/db_service.dart';
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
      BlocProvider(create: (_) => ConnectivityCubit()),
      BlocProvider(create: (context) => UserCubit(db: DatabaseService(), connection: context.read<ConnectivityCubit>())),
    ],
    child: const MainApp(),
  ));
}
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    responsive.initResponsive(context);
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeDataCustom.customData,
      initialRoute: "select_user",
      routes: {
        "select_user" : (_) => const SelectUserPage(),
        "home" : (_) => const HomePage(),
        "invest_details" : (_) => const DetailsInvestPage()
      },
    );
  }
}
