import 'dart:async';
import 'package:injectable/injectable.dart';

@singleton
class LogOutStream {
  final _controller = StreamController<String?>.broadcast(sync: true);
  Stream<String?> get stream => _controller.stream;
  void addEvent(String event) => _controller.sink.add(event);
  void dispose() {
    _controller.close();
  }
}
