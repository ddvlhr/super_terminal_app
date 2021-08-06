part of 'tcp_bloc.dart';

enum SocketConnectionState {
  connecting,
  disconnecting,
  connected,
  failed,
  none
}

@immutable
class TcpState {
  final SocketConnectionState connectionState;
  final List<String> messages;

  TcpState({required this.connectionState, required this.messages});

  factory TcpState.initial() {
    // ignore: prefer_const_literals_to_create_immutables
    return TcpState(
        connectionState: SocketConnectionState.none, messages: <String>[]);
  }

  TcpState copyWith({
    SocketConnectionState? connectionState,
    List<String>? messages
  }) {
    return TcpState(
      connectionState: connectionState ?? this.connectionState,
      messages: messages ?? this.messages
    );
  }

  TcpState copyWithNewMessage({required String message}) {
    return TcpState(
      connectionState: connectionState,
      messages: List.from(messages)..add(message)
    );
  }
}
