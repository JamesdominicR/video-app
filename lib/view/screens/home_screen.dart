import 'package:flutter/material.dart';
import 'package:machine_test_video_app/core/string_constants.dart';
import 'package:machine_test_video_app/provider/login_provider.dart';
import 'package:machine_test_video_app/view/screens/video_call_screen.dart';
import 'package:machine_test_video_app/view/widgets/icon_button_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final loginProvider = context.read<LoginProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          StringConstants.VIDEO_CONFERENCE,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(left: 15, right: 15, top: screenHeight * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                IconButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoCallScreen()));
                  },
                  title: StringConstants.START_VIDEO_CALL,
                  fixedSize: Size(screenWidth, 10),
                  backgroundColor: Colors.green,
                  iconTextColor: Colors.white,
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                IconButtonWidget(
                    onPressed: () {
                      loginProvider.signOut(context);
                    },
                    title: StringConstants.SIGN_OUT,
                    fixedSize: Size(screenWidth, 10),
                    backgroundColor: Colors.white,
                    iconTextColor: Colors.green,
                    side: BorderSide(color: Colors.green.withAlpha(150))),
                SizedBox(height: screenHeight * 0.05),
                Image.asset(
                  "assets/images/video_image.jpg",
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
