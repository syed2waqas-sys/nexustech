import 'package:nexustech/services/firebase/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nexustech/utils/app_assets.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/auth/forget_password.dart';
import 'package:nexustech/view/auth/signup.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_projects.dart';
//import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:nexustech/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   bool isLoading = false;   //This will prevent the user from repeatedly tapping the login button while Firebase is processing

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),

              // Logo
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(
              AppAssets.logowhite,
              alignment: Alignment.topLeft,
              fit: BoxFit.contain,
            ),
              ),

              const Spacer(),

              // Heading
              const Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
              ),
          
                Center(
               child: Text(
                "Log in to post projects or pick up new work.",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                color: AppColors.greyColor,
    ),
  ),
),
              const Spacer(flex: 2),

              // Email
              const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text("Email",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                hintText: "Enter your email",
                prefixIcon: Icons.mail_outline,
                textFieldController: emailController,
              ),

              const Spacer(),

              // Password
              const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text("Password",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                hintText: "Enter your password",
                prefixIcon: Icons.lock_outline,
                suffixIcon: hidePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                isObscure: hidePassword,
                textFieldController: passwordController,
                onSuffixTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),

              const Spacer(),

              // Forgot password
              Align(
              alignment: Alignment.centerRight,
  child: InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      );
    },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ),
              const Spacer(flex: 2),

              // Login button
              CustomButton(
                buttonText: "Log in",
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                borderColor: AppColors.primaryColor,
                borderRadius: 14,
                fontWeight: FontWeight.bold,
                /*onButtonTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ClientHomeScreen(),
      builder: (context) => const ManageProjects(),
      builder: (context) => const DashboardScreen(),
    ),
  );
                }*/

  onButtonTap: () {
    FirebaseAuthServices().loginWithEmailAndPassword(
      emailAddress: emailController.text,
      password: passwordController.text,
      context: context,
    );
  },

  

              ),

              const Spacer(),

              // Small note
              const Center(
                child: Text(
                  "We open the right dashboard for your role: client,\ndeveloper or admin.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: AppColors.greyColor),
                ),
              ),

              const Spacer(flex: 4),

               // Create account
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New to NexusTech? ",
                      style: TextStyle(color: AppColors.greyColor),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


