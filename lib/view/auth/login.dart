import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),

                Text("Log in to post projects or pick up new work"),

                SizedBox(height: 20),

                Text("Email",style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),),

                TextField(
                  
                )

              ],
            ),)
        )),

    );
  }
}