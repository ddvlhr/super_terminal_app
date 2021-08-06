import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tcp_state.dart';
part 'tcp_event.dart';

class TcpBloc extends Bloc<TcpEvent, TcpState> {
  Socket? _socket;
  StreamSubscription? _socketStreamSub;
  ConnectionTask<Socket>? _socketConnectionTask;

  TcpBloc() : super(TcpState.initial());

  @override
  Stream<TcpState> mapEventToState(
    TcpEvent event
  ) async * {
    if (event is Connect) {
      yield* _mapConnectToState(event);
    } else if (event is Disconnected) {
      yield* _mapDisconnectToState();
    } else if (event is ErrorOccured) {
      yield* _mapErrorToState();
    } else if (event is MessageReceived) {
      yield state.copyWithNewMessage(message: event.message);
    } else if (event is SendMessage) {
      yield* _mapSendMessageToState(event.message);
    }
  }

  Stream<TcpState> _mapConnectToState(Connect event) async * {
    yield state.copyWith(connectionState: SocketConnectionState.connecting);
    try {
      _socketConnectionTask = await Socket.startConnect(event.host, event.port);
      _socket = await _socketConnectionTask!.socket;

      _socketStreamSub = _socket!.asBroadcastStream().listen((event) {
        add(
          MessageReceived(
            message: String.fromCharCodes(event)
          )
        );
      });
      _socket!.handleError(() {
        add(ErrorOccured());
      });

      yield state.copyWith(connectionState: SocketConnectionState.connected);
    } catch (e) {
      yield state.copyWith(connectionState: SocketConnectionState.failed);
    }
  }

  Stream<TcpState> _mapDisconnectToState() async* {
    try {
      yield state.copyWith(connectionState: SocketConnectionState.disconnecting);
      _socketConnectionTask?.cancel();
      await _socketStreamSub?.cancel();
      await _socket?.close();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Stream<TcpState> _mapErrorToState() async* {
    yield state.copyWith(connectionState: SocketConnectionState.failed);
    await _socketStreamSub?.cancel();
    await _socket?.close();
  }

  Stream<TcpState> _mapSendMessageToState(String event) async * {
    if (_socket != null) {
      yield state.copyWithNewMessage(message: event);
      _socket!.writeln(event);
    }
  }

  @override
  Future<void> close() {
    _socketStreamSub?.cancel();
    _socket?.close();
    return super.close();
  }
}