import 'package:destacable_inc/cubit/connectivity/connectivity_cubit.dart';
import 'package:destacable_inc/ui/pages/connection_lost_page.dart';
import 'package:destacable_inc/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {

  late ConnectivityCubit connection;

  @override
  void initState() {
    connection = context.read<ConnectivityCubit>();
    connection.getConnectionStatus();
    super.initState();
  }

  @override
  void dispose() {
    connection.cancelSubscription();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if(state is ConnectivityInitial){
          return const ConnectionLostPage();
        }
        else if( state is ConnectivityConnectionRequest){
          return state.isConnected
          ? const HomePage()
          : const ConnectionLostPage();
        } 
        else{
          return const SizedBox();
        }
      },
    );
  }
}