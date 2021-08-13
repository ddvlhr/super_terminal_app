class SocketMessageModel {
  final int code;
  final int length;
  final String? msg;

  SocketMessageModel({required this.code, required this.length, this.msg});

  SocketMessageModel getMessage(int code, String? message) {
    var length = 0;
    if (message != null) length = message.length;
    return new SocketMessageModel(code: code, length: length, msg: message);
  }
}
