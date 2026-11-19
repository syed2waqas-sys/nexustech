
import 'package:flutter/material.dart';
import 'manage_projects.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  static const Color bgColor = Color(0xFFF6F4F0);
  static const Color borderColor = Color(0xFFE5E2DD);
  static const Color primaryColor = Color(0xFF3730C9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
                    'Ayesha Khan',
                    'Client',
                    'AK',
                    const Color(0xFFE8E8FF),
                    Colors.indigo,
                    false,
                  ),
                  userCard(
                    'Hamza Raza',
                    'Developer',
                    'HR',
                    const Color(0xFFFFF0C9),
                    Colors.orange,
                    false,
                  ),
                  userCard(
                    'Sana Malik',
                    'Developer',
                    'SM',
                    const Color(0xFFDDF5E7),
                    Colors.green,
                    false,
                  ),
                  userCard(
                    'Bilal Ahmed',
                    'Client',
                    'BA',
                    const Color(0xFFEAEAEA),
                    Colors.black87,
                    true,
                  ),
                  userCard(
                    'Omar Tariq',
                    'Developer',
                    'OT',
                    const Color(0xFFE0F0FF),
                    Colors.blue,
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
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
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Manage users',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.shield_outlined,
              color: Colors.white,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
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
        color: borderColor,
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
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.black : Colors.black54,
          ),
        ),
      ),
    );
  }

  // Search Bar
  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search users by name or role',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // User Card
  Widget userCard(
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
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
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    if (isBlocked) ...[
                      const Text(
                        ' · ',
                        style: TextStyle(color: Colors.grey),
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
          blockButton(isBlocked),
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
  Widget blockButton(bool isBlocked) {
    return Container(
      width: 72,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isBlocked ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isBlocked ? primaryColor : Colors.grey,
        ),
      ),
      child: Text(
        isBlocked ? 'Unblock' : 'Block',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isBlocked ? Colors.white : Colors.red,
        ),
      ),
    );
  }
}
