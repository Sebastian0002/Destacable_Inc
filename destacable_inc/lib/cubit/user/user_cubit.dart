import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:destacable_inc/cubit/connectivity/connectivity_cubit.dart';
import 'package:destacable_inc/data/models/data.dart';
import 'package:destacable_inc/data/services/db_service.dart';
import 'package:destacable_inc/domain/gateway/user_gateway.dart';
import 'package:destacable_inc/data/models/user.dart';
import 'package:destacable_inc/domain/usecase/user_usecase.dart';
import 'package:destacable_inc/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  late UserGateway _gateWayUser;
  late UserUsecase _usecase;
  final DatabaseService db;
  final ConnectivityCubit connection;

  UserCubit({required this.db, required this.connection}) : super(UsersInitialState()) {
    _gateWayUser = UserRepository();
    _usecase = UserUsecase(userGateway: _gateWayUser);
  }

  Future<void> getUsers() async {
    List<String> usersId;
    List<User> users = [];
    List<Data> data = [];
    final hasUsers = await db.hasUsers();
    
    if(hasUsers){
      usersId = await db.getUsersId();
      for (var userId in usersId) {
        data = await db.getDataByUserId(userId);
        users.add(User(data: data, userId: userId));
      }
      emit(UsersObtainedState(users: users));
      log("users from local database");
    }
    else{
      await fetchData();
      log("users from endpoint");
    }
  }

  Future<void> fetchData() async{
    final stat = connection.state as ConnectivityConnectionRequest;
    final hasUsers = await db.hasUsers();
    if(!stat.isConnected){
      if(!hasUsers){
        emit(UsersErrorgetState());
      }
      return;
    }

    List<User> users;
    emit(UsersLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    users = await _usecase.getUsers();
    await db.deleteAllData();
    for (var user in users) {
        final existUser = await db.existUser(user.userId);
        if(!existUser) await db.insertUser(user.userId);
        user.data.sort((a, b) => b.amount.compareTo(a.amount));
        for (var data in user.data) {
          await db.insertData(data, user.userId);
        }
      }
    emit(UsersObtainedState(users: users));
  }

}
