part of 'tcp_bloc.dart';

abstract class TcpEvent {}

class Connect extends TcpEvent {
  final dynamic host;
  final int port;

  Connect({required this.host, required this.port}) : assert(host != null);

  @override
  String toString() => '''Connect {
    host: $host,
    port: $port
  }''';
}

class Disconnected extends TcpEvent {
  @override
  String toString() => 'Disconnect {}';
}

class ErrorOccured extends TcpEvent {
  @override
  String toString() => '''ErrorOccured { }''';
}

class MessageReceived extends TcpEvent {
  final String message;

  MessageReceived({ required this.message});

  @override
  String toString() => '''MessageReceived {
    message: $message
  }''';
}

class SendMessage extends TcpEvent {
  final String message;

  SendMessage({ required this.message});

  @override
  String toString() => 'SendMessage { }';
}
