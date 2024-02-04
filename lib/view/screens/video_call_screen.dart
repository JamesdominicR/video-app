import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_video_app/provider/video_call_provider.dart';
import 'package:provider/provider.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {},
      child: Scaffold(
        body: SafeArea(
          child: Consumer<VideoCallProvider>(
            builder: (context, videoCallProvider, _) {
              videoCallProvider.initializeAgora();
              return Center(
                child: Stack(
                  children: [
                    AgoraVideoViewer(
                      client: videoCallProvider.client,
                      showNumberOfUsers: true,
                    ),
                    AgoraVideoButtons(client: videoCallProvider.client),
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
