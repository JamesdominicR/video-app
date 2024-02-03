import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_video_app/core/settings.dart';

class VideoCallProvider extends ChangeNotifier {
final client = AgoraClient(
   agoraConnectionData: AgoraConnectionData(
     appId: Settings.appId,
     channelName: 'testchannel',
     tempToken: Settings.token,
   ),
 );

 Future<void> initializeAgora() async {
  await client.initialize();
 }

}