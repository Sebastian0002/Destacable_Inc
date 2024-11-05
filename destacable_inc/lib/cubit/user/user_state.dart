part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UsersInitialState extends UserState {}

final class UsersLoadingState extends UserState {
  
}

final class UsersObtained extends UserState {
  final List<User> users;
  UsersObtained({required this.users});
}
