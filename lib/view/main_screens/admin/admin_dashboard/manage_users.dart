/*
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_projects.dart';
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
                    
                    'Nimra Siddiqui',
                    'Developer',
                    'NS',
                    const Color(0xFFE8E8FF),
                    Colors.indigo,
                  ),
                  userCard(
                    1,
                    'Syed Muhammad Waqas',
                    'Client',
                    'SMW',
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: statCard('128', 'Users')),
          const SizedBox(width: 10),
          Expanded(child: statCard('41', 'Projects')),
          const SizedBox(width: 10),
          Expanded(child: statCard('3', 'Blocked')),
        ],
      ),
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
*/

//backend implement 
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_projects.dart';
import 'package:nexustech/widgets/custom_textfield.dart';
import 'package:nexustech/widgets/navbar.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String searchText = '';

  // Update blocked status in Firestore
  Future<void> toggleBlock(String userId, bool isBlocked) async {
    await firestore.collection('users').doc(userId).update({
      'blocked': !isBlocked,
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

            // Fetch users from Firestore
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error loading users'),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No users found'),
                    );
                  }

                  final users = snapshot.data!.docs;

                  // Search users by name or role
                  final filteredUsers = users.where((doc) {
                    final data =
                        doc.data() as Map<String, dynamic>;

                    final name =
                        (data['name'] ?? '').toString().toLowerCase();

                    final role =
                        (data['role'] ?? '').toString().toLowerCase();

                    return name.contains(searchText.toLowerCase()) ||
                        role.contains(searchText.toLowerCase());
                  }).toList();

                  if (filteredUsers.isEmpty) {
                    return const Center(
                      child: Text('No matching users'),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final doc = filteredUsers[index];
                      final data =
                          doc.data() as Map<String, dynamic>;

                      final name =
                          (data['name'] ?? 'Unknown').toString();

                      final role =
                          (data['role'] ?? 'Unknown').toString();

                      final blocked = data['blocked'] == true;

                      // Generate initials
                      final initials = name
                          .trim()
                          .split(' ')
                          .where((word) => word.isNotEmpty)
                          .map((word) => word[0])
                          .take(2)
                          .join()
                          .toUpperCase();

                      // Avatar colors
                      final avatarColors = [
                        const Color(0xFFE8E8FF),
                        const Color(0xFFFFF0C9),
                        const Color(0xFFDDF5E7),
                        const Color(0xFFEAEAEA),
                        const Color(0xFFE0F0FF),
                      ];

                      final textColors = [
                        Colors.indigo,
                        Colors.orange,
                        Colors.green,
                        Colors.black87,
                        Colors.blue,
                      ];

                      return userCard(
                        doc.id,
                        name,
                        role,
                        initials,
                        avatarColors[index % avatarColors.length],
                        textColors[index % textColors.length],
                        blocked,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: statCard('128', 'Users')),
          const SizedBox(width: 10),
          Expanded(child: statCard('41', 'Projects')),
          const SizedBox(width: 10),
          Expanded(child: statCard('3', 'Blocked')),
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomTextField(
        hintText: 'Search users by name or role',
        prefixIcon: Icons.search,
        showBorder: false,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
      ),
    );
  }

  // User Card
  Widget userCard(
    String userId,
    String name,
    String role,
    String initials,
    Color avatarBg,
    Color avatarText,
    bool isBlocked,
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
                    if (isBlocked) ...[
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
          blockButton(userId, isBlocked),
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
  Widget blockButton(String userId, bool isBlocked) {
    return GestureDetector(
      onTap: () async {
        try {
          await toggleBlock(userId, isBlocked);
        } catch (e) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to update user: $e'),
            ),
          );
        }
      },
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isBlocked
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isBlocked
                ? AppColors.primaryColor
                : AppColors.greyColor,
          ),
        ),
        child: Text(
          isBlocked ? 'Unblock' : 'Block',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isBlocked
                ? AppColors.whiteColor
                : Colors.red,
          ),
        ),
      ),
    );
  }
}
