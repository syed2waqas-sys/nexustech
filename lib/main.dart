import 'package:flutter/material.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/view/main_screens/client/projects/project_detail_screen.dart';
import 'package:nexustech/view/main_screens/client/proposals/received_proposal_screen.dart';
import 'package:nexustech/view/splash_screen/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ClientHomeScreen()
    );
  }
}

