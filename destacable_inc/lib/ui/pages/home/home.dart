import 'package:destacable_inc/cubit/user/user_cubit.dart';
import 'package:destacable_inc/data/models/user.dart';
import 'package:destacable_inc/ui/pages/home/widgets/card_invest.dart';
import 'package:destacable_inc/ui/pages/home/widgets/widgets.dart';
import 'package:destacable_inc/ui/pages/pages.dart';
import 'package:destacable_inc/ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<UserCubit>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CardUserProperties cardUserSelected = 
      ModalRoute.of(context)!.settings.arguments as CardUserProperties;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 22*responsive.scaleWidth),
            padding: EdgeInsets.all(3*responsive.scaleAverage),
            width: 45*responsive.scaleWidth,
            height: 45*responsive.scaleWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardUserSelected.color
            ),
            child: Image.asset("assets/images/boy.png"),
          ),
        ],
        ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is UsersInitialState || state is UsersLoadingState) {
            return const LoadingData();
          } else if (state is UsersObtained) {
            return DataWidget(
              state: state,
              userIdSelected: cardUserSelected.userId,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({super.key, required this.state, required this.userIdSelected});
  final UsersObtained state;
  final String userIdSelected;

  @override
  Widget build(BuildContext context) {
    
    final User userSelected = state.users.where((e) => e.userId == userIdSelected).single;

    return Column(
      children: [
        _Top(userSelected: userSelected),
        SizedBox(height: 20*responsive.scaleHeight),
        _Body(userSelected: userSelected)
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.userSelected,
  });

  final User userSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22*responsive.scaleWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Investments", 
            style: TextStyle(fontSize: 20*responsive.scaleAverage, fontWeight: FontWeight.w500)),
          Text(
            "Details", 
            style: TextStyle(fontSize: 15*responsive.scaleAverage, fontWeight: FontWeight.w400)),
          SizedBox(height: 20*responsive.scaleHeight),
          SizedBox(
            width: double.infinity,
            height: responsive.screenHeight*0.36,
            child: ListView.builder(
              itemCount: userSelected.data.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final data = userSelected.data[index];
                return const CardInvest();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({
    required this.userSelected,
  });

  final User userSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320*responsive.scaleHeight,
      decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22*responsive.scaleWidth),
        child: Column(
          children: [
            HeaderDataUser(userSelected),
            SizedBox(height: 33*responsive.scaleHeight),
            BarChart(userSelected)
          ],
        ),
      ),
    );
  }
}



class LoadingData extends StatelessWidget {
  const LoadingData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Espere un momento porfavor",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 30),
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
