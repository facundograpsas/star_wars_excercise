import 'package:equatable/equatable.dart';

class AppConnectionState extends Equatable {
  const AppConnectionState({this.connection = false});
  final bool connection;
  AppConnectionState copyWith({bool? connection}) {
    return AppConnectionState(connection: connection ?? this.connection);
  }

  @override
  List<Object> get props => [connection];
}
