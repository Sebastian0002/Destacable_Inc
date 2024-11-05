import 'package:destacable_inc/domain/gateway/user_gateway.dart';
import 'package:destacable_inc/data/models/user.dart';

class UserUsecase {
  UserUsecase({required UserGateway userGateway}) : _userGateway = userGateway;
  final UserGateway _userGateway;  

  Future<List<User>> getUsers() async{
    return await _userGateway.getUsers();
  }

}