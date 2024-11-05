import 'package:destacable_inc/data/models/user.dart';

abstract class UserGateway {

  Future<List<User>> getUsers();

}