import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_video_app/provider/video_call_provider.dart';
import 'package:machine_test_video_app/provider/login_provider.dart';
import 'package:machine_test_video_app/view/screens/login_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
//Todo: credential for testing
//Email: james@gmail.com
//password: testing@123

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => VideoCallProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
