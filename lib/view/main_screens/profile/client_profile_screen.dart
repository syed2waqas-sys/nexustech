
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/auth/login.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/client/proposals/received_proposal_screen.dart';
import 'package:nexustech/widgets/custom_button.dart';
import 'package:nexustech/widgets/client_navbar.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({super.key});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 12,
                          color: AppColors.textColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Profile Information
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xffE9E9FF),
                    child: Text(
                      "AK",
                      style: TextStyle(
                        color: Color(0xff3535D5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ayesha Khan",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "ayesha.khan@example.com",
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE7E5FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Client",
                          style: TextStyle(
                            fontSize: 8,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Bio
              Text(
                "About",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Looking for talented developers and designers to bring "
                "my business ideas to life. I enjoy working with creative "
                "people and building useful digital solutions.",
                style: TextStyle(
                  fontSize: 11,
                  height: 1.4,
                  color: AppColors.textColor,
                ),
              ),

              const SizedBox(height: 16),

              // Project Statistics
              Text(
                "Project Statistics",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Expanded(child: _statCard("2", "Open")),
                  const SizedBox(width: 8),
                  Expanded(child: _statCard("1", "In progress")),
                  const SizedBox(width: 8),
                  Expanded(child: _statCard("4", "Completed")),
                ],
              ),

              const SizedBox(height: 16),

              // Account Type
              Text(
                "Account Type",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 7),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.business_center_outlined,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Client Account",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.check_circle,
                      size: 15,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Logout Button
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        backgroundColor: AppColors.whiteColor,
                        title: const Text("Log out"),
                        content: const Text(
                          "Are you sure you want to log out?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              "Log out",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CustomButton(
                  buttonColor: AppColors.whiteColor,
                  textColor: Colors.red,
                  buttonText: "Log out",
                  height: 45,
                  borderRadius: 10,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  borderColor: AppColors.borderColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClientNavbar(
        selectedIndex: 3,
        onItemTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ClientHomeScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Project_Screen(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProposalsScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  // Statistics Card
  Widget _statCard(String number, String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 9,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
