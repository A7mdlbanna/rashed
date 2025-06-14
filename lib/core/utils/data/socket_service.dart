import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  static late Socket socket;

  static init(){
    socket = io('http://209.38.155.136:8002/', <String, dynamic>{'transports': ['websocket']});
    socket.onConnect((data) => debugPrint('-- connected -- $data'));
    socket.onConnectError((data) => debugPrint('-- connection error -- $data'));
    socket.onclose((data) => debugPrint('-- closed -- $data'));
    socket.onDisconnect((data) => debugPrint('-- disconnected -- $data'));
  }

  static emit(String event, {Map? message}) {
    debugPrint(message.toString());
    socket.emit(event, message);
  }

  static listen(String event, dynamic Function(dynamic) callback){
    if(socket.hasListeners(event)) socket.off(event);
    socket.on(event, callback);
  }
}