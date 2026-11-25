import 'package:flutter/material.dart';
import 'package:nexustech/services/firebase/firebase_auth_services.dart';
import 'package:nexustech/utils/app_colors.dart';

import 'package:nexustech/widgets/custom_button.dart';
import 'package:nexustech/widgets/custom_textfield.dart';

//bject of your FirebaseAuthServices class so you can call its methods from your Forgot Password screen.
final authServices = FirebaseAuthServices();

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  // When true, the green "Link sent" message is shown
  bool linkSent = false;

  @override
  void dispose() {
    emailController.dispose();
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

              const Spacer(flex: 3),

              // Lock icon box
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.lock_outline,
                  color: AppColors.primaryColor,
                  size: 28,
                ),
              ),

              const Spacer(),

              // Title
              const Text(
                "Reset your password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),

              const Spacer(),

              // Subtitle
              const Text(
                "Enter the email you signed up with and we will send you a link to choose a new password.",
                style: TextStyle(fontSize: 15, color: AppColors.greyColor),
              ),

              const Spacer(flex: 2),

              // Email
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              CustomTextField(
                hintText: "Email",
                prefixIcon: Icons.mail_outline,
                textFieldController: emailController,
              ),

              const Spacer(),

              // Send reset link button
              CustomButton(
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                buttonText: "Send reset link",
                borderColor: AppColors.primaryColor,
                height: 52,
                borderRadius: 14,
                fontWeight: FontWeight.bold,
                /*onButtonTap: () {
                  
                  setState(() {
                    linkSent = true;
                  });
                },
                */
                onButtonTap: () async {
  if (emailController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter your email')),
    );
    return;
  }

  await authServices.forgotPassword(
    emailAddress: emailController.text,
    context: context,
  );

  if (!mounted) return;

  setState(() {
    linkSent = true;
  });
},
              ),

              const Spacer(),

              // Green success message (only shows after the button is tapped)
              if (linkSent)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDF2E3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF1F5130),
                        size: 22,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Link sent. Check your inbox, then return here to log in. It can take a minute to arrive.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1F5130),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const Spacer(flex: 6),

              // Back to log in
              Center(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "Back to log in",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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