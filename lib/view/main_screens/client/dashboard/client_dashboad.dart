import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/projects/project_detail_screen.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/view/main_screens/client/projects/client_projects_data.dart';
import 'package:nexustech/view/main_screens/client/proposals/received_proposal_screen.dart';
import 'package:nexustech/view/main_screens/profile/client_profile_screen.dart';
import 'package:nexustech/widgets/custom_button.dart';
import 'package:nexustech/widgets/client_navbar.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final Color backgroundColor = const Color(0xFFF7F6F2);
  final Color primaryColor = const Color(0xFF3535D5);
  final Color borderColor = const Color(0xFFE5E3DE);

  void openPostScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Project_Screen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),

                const SizedBox(height: 20),

                ValueListenableBuilder<List<Map<String, dynamic>>>(
                  valueListenable: ClientProjectsData.projects,
                  builder: (context, projects, child) {
                    final openCount = projects
                        .where((project) => project['status'] == 'Open')
                        .length;

                    final inProgressCount = projects
                        .where((project) => project['status'] == 'In Progress')
                        .length;

                    final completedCount = projects
                        .where((project) => project['status'] == 'Completed')
                        .length;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _statCard('$openCount', 'Open'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _statCard(
                                '$inProgressCount',
                                'In progress',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _statCard(
                                '$completedCount',
                                'Completed',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My projects',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: openPostScreen,
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF3535D5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        for (int i = 0; i < projects.length; i++) ...[
                          _projectCard(
                            status: projects[i]['status'] ?? 'Open',
                            statusColor:
                                projects[i]['status'] == 'Completed'
                                    ? const Color(0xFFDDF5E6)
                                    : projects[i]['status'] == 'In Progress'
                                        ? const Color(0xFFDDF2FF)
                                        : const Color(0xFFE8E9FF),
                            statusTextColor:
                                projects[i]['status'] == 'Completed'
                                    ? const Color(0xFF21834C)
                                    : projects[i]['status'] == 'In Progress'
                                        ? const Color(0xFF1682B8)
                                        : const Color(0xFF3535D5),
                            date: projects[i]['date'] ?? 'Posted just now',
                            title: projects[i]['title'] ?? '',
                            category: projects[i]['category'] ?? '',
                            price: projects[i]['price'] ?? '',
                            extra: projects[i]['extra'] ?? '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjectDetailScreen(
                                    project: projects[i],
                                  ),
                                ),
                              );
                            },
                          ),
                          if (i != projects.length - 1)
                            const SizedBox(height: 12),
                        ],
                      ],
                    );
                  },
                ),

                const SizedBox(height: 35),

                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 150,
                    child: CustomButton(
                      buttonColor: primaryColor,
                      textColor: AppColors.whiteColor,
                      buttonText: '+ Post project',
                      height: 45,
                      borderRadius: 25,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      onButtonTap: openPostScreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClientNavbar(
        selectedIndex: 0,
        onItemTap: (index) {
          if (index == 1) {
            openPostScreen();
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProposalsScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ClientProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Good morning',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              'Syed Waqas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFE9E9FF),
          child: Text(
            'SW',
            style: TextStyle(
              color: Color(0xFF3535D5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statCard(String number, String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _projectCard({
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required String date,
    required String title,
    required String category,
    required String price,
    required String extra,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 10,
                      color: statusTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  extra,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}