part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UsersInitialState extends UserState {}

final class UsersLoadingState extends UserState {}

final class UsersErrorgetState extends UserState {}

final class UsersObtainedState extends UserState {
  final List<User>? users;
  
  UsersObtainedState copyWith({
    List<User>? users
  })=> UsersObtainedState(
      users: users ?? this.users);

  UsersObtainedState({this.users = const []});
}
