import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_assets.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/auth/login.dart';
import 'package:nexustech/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          // Background network graph: full width, pinned to the top, never scaled by height
          Positioned.fill(
            child: Image.asset(
              AppAssets.dots,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Proportional space above the logo (377 of 844 in the design)
                  const Spacer(flex: 377),

                  // Logo
                  Container(
                    height: 72,
                    width: 72,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      AppAssets.logo,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // App name
                  const Text(
                    'NexusTech',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1.2,
                      height: 1.1,
                      color: AppColors.whiteColor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Tagline
                  const Text(
                    'Software built by people you can\n'
                    'actually afford to hire.',
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.6,
                      color: AppColors.whiteSoftColor,
                    ),
                  ),

                  // Gap between tagline and progress row (about 115 in the design)
                  const Spacer(flex: 115),

                  // Loading progress
                  Row(
                    children: [
                      Container(
                        width: 120,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.whiteFadedColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 72,
                            height: 3,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Checking your session',
                        style: TextStyle(
                          color: AppColors.whiteSoftColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // Continue button
                  CustomButton(
                    buttonText: 'Continue',
                    buttonColor: AppColors.whiteColor,
                    textColor: AppColors.primaryColor,
                    height: 52,
                    borderRadius: 16,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    onButtonTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}