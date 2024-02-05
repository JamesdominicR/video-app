import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_video_app/provider/video_call_provider.dart';
import 'package:provider/provider.dart';

class VideoCallScreen extends StatelessWidget {
  final String userName;
  const VideoCallScreen({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {},
      child: Scaffold(
        body: SafeArea(
          child: Consumer<VideoCallProvider>(
            builder: (context, videoCallProvider, _) {
              videoCallProvider.userName = userName;
              videoCallProvider.initializeAgora();
              return Center(
                child: Stack(
                  children: [
                    AgoraVideoViewer(
                      client: videoCallProvider.client,
                      enableHostControls: true,
                      showNumberOfUsers: true,
                    ),
                    AgoraVideoButtons(client: videoCallProvider.client,
                      addScreenSharing: false,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
