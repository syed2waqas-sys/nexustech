/*import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const Color _primary = Color(0xFF3438C8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primary,
      body: Stack(
        children: [
          // Background dots image
          Positioned.fill(
            child: Image.asset(
              AppAssets.dots,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 310),

                  // Logo
                  Container(
                    height: 72,
                    width: 72,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      AppAssets.logo,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 26),

                  // App name
                  const Text(
                    'NexusTech',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Tagline
                  const Text(
                    'Software built by people you can\n'
                    'actually afford to hire.',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),

                  const Spacer(),

                  // Loading progress
                  Row(
                    children: [
                      Container(
                        width: 120,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 72,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Checking your session',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 53,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to next screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: _primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 55),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/