//import 'package:nexustech/service/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:nexustech/services/firebase/firebase_auth_services.dart';
import 'package:nexustech/utils/app_assets.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/auth/login.dart';

import 'package:nexustech/widgets/custom_button.dart';
import 'package:nexustech/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Which role is selected: "client" or "developer"
  String selectedRole = "client";
  bool isLoading = false; 

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              const Spacer(),

              // Back button
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.chevron_left, size: 30),
              ),

              const Spacer(),

              // Title
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const Spacer(),
              const Text(
                "Pick a role. It is fixed after sign-up, so choose the one that fits.",
                style: TextStyle(fontSize: 15, color: AppColors.greyColor),
              ),

              const Spacer(flex: 2),

              // Role cards
              // Spacer inside a Row: the cards get flex 12 and the gap gets flex 1
             /* Row(
  children: [
    Expanded(
      child: roleCard(
        role: "client",
        imagePath: AppAssets.client,
        title: "Client",
        subtitle: "I need software built",
      ),
    ),
                  const Spacer(),
                  Expanded(
                    flex: 12,
                    child: roleCard(
                      role: "developer",
                      imagePath: AppAssets.developer,
                      title: "Developer",
                      subtitle: "I build software",
                    ),
                  ),
                ],
              ),*/

              Row(
  children: [
    Expanded(
      child: roleCard(
        role: "client",
        imagePath: AppAssets.client,
        title: "Client",
        subtitle: "I need software built",
      ),
    ),

    const SizedBox(width: 12),

    Expanded(
      child: roleCard(
        role: "developer",
        imagePath: AppAssets.developer,
        title: "Developer",
        subtitle: "I build software",
      ),
    ),
  ],
),

              const Spacer(flex: 2),

              // Full name
              label("Full name"),
              CustomTextField(
                hintText: "Full name",
                textFieldController: nameController,
              ),

              const Spacer(),

              // Email
              label("Email"),
              CustomTextField(
                hintText: "Email",
                textFieldController: emailController,
              ),

              const Spacer(),

              // Password
              label("Password"),
              CustomTextField(
                hintText: "Password",
                isObscure: true,
                textFieldController: passwordController,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  "At least 6 characters",
                  style: TextStyle(fontSize: 12, color: AppColors.greyColor),
                ),
              ),

              // Big spacer pushes the button and login text to the bottom
              const Spacer(flex: 6),

              // Create account button
              CustomButton(
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                buttonText: "Create account",
                borderColor: AppColors.primaryColor,
                height: 52,
                borderRadius: 14,
                fontWeight: FontWeight.bold,
                /*onButtonTap: () {

                  // TODO: add sign up logic here
                  print("Role: $selectedRole");
                  print("Name: ${nameController.text}");
                  print("Email: ${emailController.text}");
                },*/

                 // FIREBASE SIGNUP AUTHENTICATION
  /*onButtonTap: () {
    FirebaseAuthServices().signupWithEmailAndPassword(
      name: nameController.text,
      emailAddress: emailController.text,
      password: passwordController.text,
      role: selectedRole,
    );
  },*/

  onButtonTap: () async {
  if (isLoading) return;

  if (nameController.text.trim().isEmpty ||
      emailController.text.trim().isEmpty ||
      passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill all fields")),
    );
    return;
  }

  if (passwordController.text.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password must be at least 6 characters"),
      ),
    );
    return;
  }

  await FirebaseAuthServices().signupWithEmailAndPassword(
    name: nameController.text.trim(),
    emailAddress: emailController.text.trim(),
    password: passwordController.text,
    role: selectedRole,
    context: context,
    setLoading: (value) {
      if (mounted) {
        setState(() {
          isLoading = value;
        });
      }
    },
  );
},
              ),

              const Spacer(),

              // Log in text
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Already registered? ",
                      style: TextStyle(color: AppColors.greyColor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
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

  // Small label above each text field
  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
      ),
    );
  }

  // One role card (Client / Developer)
  // Note: Spacer cannot be used inside this Column because its height is not
  // fixed, so small gaps here use Padding instead.
  Widget roleCard({
    required String role,
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = selectedRole == role;

    return InkWell(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.12)
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  size: 22,
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 2),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}