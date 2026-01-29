import 'dart:developer';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherConfig {
  PusherConfig._internal();
  static final PusherConfig _instance = PusherConfig._internal();
  factory PusherConfig() => _instance;
  late PusherChannelsFlutter _pusher;

  String apiKey = "77bdbdd971e8b1fb165c";
  String apiCluster = "mt1";

  Future<void> initPusher({
    required dynamic Function(PusherEvent)? onEvent,
    required String channelName,
    required String roomId,
  }) async {
    _pusher = PusherChannelsFlutter.getInstance();

    try {
      await _pusher.init(
        apiKey: apiKey,
        cluster: apiCluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );

      try {
        await _pusher.subscribe(channelName: "$channelName$roomId");

        log("trying to subscribe to :  $channelName$roomId");
      } catch (e) {
        log(e.toString());
      }

      await _pusher.connect();
    } catch (e) {
      log("error in initialization: $e");
    }
  }

  void disconnect() {
    _pusher.disconnect();
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = _pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log(
      "onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount",
    );
  }
}
