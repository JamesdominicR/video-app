import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_video_app/core/settings.dart';
import 'package:machine_test_video_app/provider/login_provider.dart';

class VideoCallProvider extends ChangeNotifier {
  String? userName = "";
  late AgoraClient client;

  Future<void> initializeAgora() async {
     client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: Settings.appId,
        channelName: 'testChannel',
        tempToken: Settings.token,
        username: userName,
      ),
    );
    await client.initialize();
  }
}
