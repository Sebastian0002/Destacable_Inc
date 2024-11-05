import 'package:destacable_inc/constants/environments.dart';
import 'package:destacable_inc/domain/gateway/user_gateway.dart';
import 'package:destacable_inc/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserRepository extends UserGateway {
  final dio = Dio();
  @override
  Future<List<User>> getUsers() async{
    final List<User> users = [];
    try {
      final response = await dio.get('$api/users/');
        for (var e in response.data['users']) {
          users.add(User.fromMap(e));
        }
    } on DioException catch(e) {
      debugPrint(e.toString());
      rethrow;
    }
    return users;
  }

}

