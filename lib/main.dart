import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nexustech/firebase_options.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_users.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/developer/dashboard/developer_dashboard.dart';
import 'package:nexustech/view/main_screens/profile/client_profile_screen.dart';
import 'package:nexustech/view/splash_screen/spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ClientHomeScreen(),
    );
  }
}