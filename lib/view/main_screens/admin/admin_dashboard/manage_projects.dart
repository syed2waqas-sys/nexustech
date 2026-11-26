import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_users.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/admin_projects_data.dart';
import 'package:nexustech/widgets/custom_textfield.dart';
import 'package:nexustech/widgets/navbar.dart';

class ManageProjects extends StatefulWidget {
  const ManageProjects({super.key});

  @override
  State<ManageProjects> createState() => _ManageProjectsState();
}

class _ManageProjectsState extends State<ManageProjects> {
  void deleteProject(int index) {
    AdminProjectsData.deleteProject(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            tabs(),
            searchBar(),
            Expanded(
              child: projectList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(
        selectedIndex: 1,
        onItemTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ManageScreen(),
              ),
            );
          } else if (index == 2) {
            // Logout functionality can be added here.
          }
        },
      ),
    );
  }

  // Header
  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin dashboard',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  'Manage projects',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.person_outline,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }

  // Tabs
  Widget tabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E2DD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: tabItem('Users', false),
          ),
          Expanded(
            child: tabItem('Projects', true),
          ),
        ],
      ),
    );
  }

  // Single Tab
  Widget tabItem(String title, bool isSelected) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ManageScreen(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.textColor : Colors.black54,
          ),
        ),
      ),
    );
  }

  // Search Bar
  Widget searchBar() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: CustomTextField(
        hintText: 'Search by title or owner',
        prefixIcon: Icons.search,
        showBorder: false,
      ),
    );
  }

  // Project List
  Widget projectList() {
    return ValueListenableBuilder<List<Map<String, String>>>(
      valueListenable: AdminProjectsData.projects,
      builder: (context, projects, child) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return projectCard(projects[index], index);
          },
        );
      },
    );
  }

  // Project Card
  Widget projectCard(Map<String, String> project, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    statusBadge(project['status']!),
                    const SizedBox(width: 8),
                    Text(
                      'by ${project['owner']}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              deleteProject(index);
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // Status Badge
  Widget statusBadge(String status) {
    Color badgeColor;
    Color textColor;

    if (status == 'Open') {
      badgeColor = const Color(0xFFE8E8FF);
      textColor = Colors.indigo;
    } else if (status == 'In Progress') {
      badgeColor = const Color(0xFFE4EDFF);
      textColor = Colors.blue;
    } else if (status == 'Completed') {
      badgeColor = const Color(0xFFDDF5E7);
      textColor = Colors.green;
    } else {
      badgeColor = const Color(0xFFEAEAEA);
      textColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}