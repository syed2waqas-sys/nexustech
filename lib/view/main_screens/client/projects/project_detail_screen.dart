import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/view/main_screens/client/proposals/received_proposal_screen.dart';
import 'package:nexustech/widgets/custom_button.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Project_Screen(),
                          ),
                        );
                      },
                      child: const Row(
                        children: [Icon(Icons.edit), Text("edit")],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E9FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Open"),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Inventory tracker\nfor my bakery",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Posted 2 days ago by you",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Expanded(
                      child: StatCard(
                        title: "Budget",
                        value: "\$400 to\n\$600",
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Expanded(
                      child: StatCard(title: "Category", value: "Mobile app"),
                    ),

                    const SizedBox(width: 8),

                    const Expanded(
                      child: StatCard(title: "Proposals", value: "6 received"),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  "About this project",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text(
                  "I run a small bakery and want a simple app to log daily stock, flag items running low, and see what sold best each week. Android first, iOS later.",
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonColor: Colors.blue,
                  buttonText: "Review 6 proposals",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  onButtonTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProposalsScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClientHomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Close Project",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable StatCard Widget

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title), const SizedBox(height: 8), Text(value)],
      ),
    );
  }
}
