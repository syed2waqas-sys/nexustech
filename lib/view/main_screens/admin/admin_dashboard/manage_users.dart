import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_projects.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/admin_projects_data.dart';
import 'package:nexustech/widgets/custom_textfield.dart';
import 'package:nexustech/widgets/navbar.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  final List<bool> blockedUsers = [
    false,
    false,
    false,
    true,
    false,
  ];

  void toggleBlock(int index) {
    setState(() {
      blockedUsers[index] = !blockedUsers[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            statsRow(),
            const SizedBox(height: 16),
            tabs(),
            searchBar(),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  userCard(
                    0,
                    'Ayesha Khan',
                    'Client',
                    'AK',
                    const Color(0xFFE8E8FF),
                    Colors.indigo,
                  ),
                  userCard(
                    1,
                    'Hamza Raza',
                    'Developer',
                    'HR',
                    const Color(0xFFFFF0C9),
                    Colors.orange,
                  ),
                  userCard(
                    2,
                    'Sana Malik',
                    'Developer',
                    'SM',
                    const Color(0xFFDDF5E7),
                    Colors.green,
                  ),
                  userCard(
                    3,
                    'Bilal Ahmed',
                    'Client',
                    'BA',
                    const Color(0xFFEAEAEA),
                    Colors.black87,
                  ),
                  userCard(
                    4,
                    'Omar Tariq',
                    'Developer',
                    'OT',
                    const Color(0xFFE0F0FF),
                    Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(
        selectedIndex: 0,
        onItemTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ManageProjects(),
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
                  'Manage users',
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
              Icons.shield_outlined,
              color: AppColors.whiteColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Statistics
  Widget statsRow() {
    int totalUsers = blockedUsers.length;
    int totalBlocked =
        blockedUsers.where((isBlocked) => isBlocked).length;

    return ValueListenableBuilder<List<Map<String, String>>>(
      valueListenable: AdminProjectsData.projects,
      builder: (context, projects, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: statCard('$totalUsers', 'Users')),
              const SizedBox(width: 10),
              Expanded(child: statCard('${projects.length}', 'Projects')),
              const SizedBox(width: 10),
              Expanded(child: statCard('$totalBlocked', 'Blocked')),
            ],
          ),
        );
      },
    );
  }

  Widget statCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.greyColor,
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
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(child: tabItem('Users', true)),
          Expanded(child: tabItem('Projects', false)),
        ],
      ),
    );
  }

  Widget tabItem(String title, bool isSelected) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ManageProjects(),
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
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomTextField(
        hintText: 'Search users by name or role',
        prefixIcon: Icons.search,
        showBorder: false,
      ),
    );
  }

  // User Card
  Widget userCard(
    int index,
    String name,
    String role,
    String initials,
    Color avatarBg,
    Color avatarText,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          avatar(initials, avatarBg, avatarText),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.greyColor,
                      ),
                    ),
                    if (blockedUsers[index]) ...[
                      const Text(
                        ' · ',
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      const Text(
                        'Blocked',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          blockButton(index),
        ],
      ),
    );
  }

  // Avatar
  Widget avatar(String initials, Color bg, Color fg) {
    return Container(
      height: 36,
      width: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
      ),
      child: Text(
        initials,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: fg,
        ),
      ),
    );
  }

  // Block Button
  Widget blockButton(int index) {
    return GestureDetector(
      onTap: () {
        toggleBlock(index);
      },
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: blockedUsers[index]
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: blockedUsers[index]
                ? AppColors.primaryColor
                : AppColors.greyColor,
          ),
        ),
        child: Text(
          blockedUsers[index] ? 'Unblock' : 'Block',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: blockedUsers[index]
                ? AppColors.whiteColor
                : Colors.red,
          ),
        ),
      ),
    );
  }
}