import 'dart:io';

class SocketHelper {
  static late Socket socket;

  static Future<Socket> connect(String ip, int port) async {
    return await Socket.connect(ip, port);
  }

  static void receiveMsgHandle(List<int> data) {}
  static void onSocketError(Object error) {}
  static void onSocketClose() {}

  static Future<void> sendMessage(String message) async {
    socket.write(message);
    await Future.delayed(const Duration(seconds: 2));
  }
}