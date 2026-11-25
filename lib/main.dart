/*//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'package:flutter/material.dart';
//import 'package:nexustech/view/main_screens/developer/projects/project_list_screen.dart';
import 'package:nexustech/view/splash_screen/spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

/*void main() {
  runApp(const MyApp());
}*/

//for firebase 
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Prepares Flutter before initialization tasks.

  await Firebase.initializeApp(  //Connects your app to Firebase
    options: DefaultFirebaseOptions.currentPlatform,  //Loads the Firebase settings for the current platform
  );

  runApp(const MyApp());  //Starts your Flutter app after Firebase is ready
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
      //home: BrowseProjects()
      home: SplashScreen()

    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nexustech/firebase_options.dart';


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
      title: 'NexusTech',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: SplashScreen(),
    );
  }
}