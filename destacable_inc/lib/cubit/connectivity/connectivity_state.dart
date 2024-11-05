part of 'connectivity_cubit.dart';

@immutable
sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {
  final bool isConnected = false;

}

final class ConnectivityConnectionRequest extends ConnectivityState {
  final bool isConnected;
  ConnectivityConnectionRequest({required this.isConnected});
}