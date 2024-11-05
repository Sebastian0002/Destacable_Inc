import 'package:destacable_inc/cubit/connectivity/connectivity_cubit.dart';
import 'package:destacable_inc/cubit/user/user_cubit.dart';
import 'package:destacable_inc/data/services/db_service.dart';

class CubitProvider {
  static final UserCubit instanceuser = UserCubit(db: DatabaseService());
  static final ConnectivityCubit instanceconnect = ConnectivityCubit();
}