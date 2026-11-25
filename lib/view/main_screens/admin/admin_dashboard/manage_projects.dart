/*
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_users.dart';
import 'package:nexustech/widgets/custom_textfield.dart';
import 'package:nexustech/widgets/navbar.dart';

class ManageProjects extends StatefulWidget {
  const ManageProjects({super.key});

  @override
  State<ManageProjects> createState() => _ManageProjectsState();
}

class _ManageProjectsState extends State<ManageProjects> {
  List<Map<String, String>> projects = [
    {
      'title': 'Inventory tracker for my bakery',
      'owner': 'Ayasha Khan',
      'status': 'Open',
    },
    {
      'title': 'Portfolio site for photography studio',
      'owner': 'Ayasha Khan',
      'status': 'In Progress',
    },
    {
      'title': 'Quiz app for a school society',
      'owner': 'Bilal Ahmed',
      'status': 'Open',
    },
    {
      'title': 'Landing page for the society fest',
      'owner': 'Ayasha Khan',
      'status': 'Completed',
    },
    {
      'title': 'Booking app for a campus gym',
      'owner': 'Zara Iqbal',
      'status': 'Closed',
    },
    {
      'title': 'Habit tracker with weekly streaks',
      'owner': 'Zara Iqbal',
      'status': 'Open',
    },
  ];

  void deleteProject(int index) {
    setState(() {
      projects.removeAt(index);
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
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return projectCard(projects[index], index);
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
}*/

//backend implementgit add .
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_users.dart';
import 'package:nexustech/widgets/navbar.dart';

class ManageProjects extends StatefulWidget {
  const ManageProjects({super.key});

  @override
  State<ManageProjects> createState() => _ManageProjectsState();
}

class _ManageProjectsState extends State<ManageProjects> {

  final TextEditingController searchController = TextEditingController();

  String searchText = '';

  // Delete project from Firebase
  Future<void> deleteProject(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('projects')
          .doc(documentId)
          .delete();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Project deleted successfully'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting project: $e'),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {
            searchText = value.toLowerCase().trim();
          });
        },
        decoration: InputDecoration(
          hintText: 'Search by title or owner',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: AppColors.whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Project List - Firebase
  Widget projectList() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('projects')
          .snapshots(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong while loading projects'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No projects found'),
          );
        }

        // Firebase documents
        var projectDocs = snapshot.data!.docs;

        // Search filter
        projectDocs = projectDocs.where((doc) {
          String title = (doc.data()['title'] ?? '')
              .toString()
              .toLowerCase();

          String owner = (doc.data()['owner'] ?? '')
              .toString()
              .toLowerCase();

          return title.contains(searchText) ||
              owner.contains(searchText);
        }).toList();

        if (projectDocs.isEmpty) {
          return const Center(
            child: Text('No matching projects found'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: projectDocs.length,
          itemBuilder: (context, index) {

            var projectData = projectDocs[index].data();

            return projectCard(
              {
                'title': (projectData['title'] ?? '').toString(),
                'owner': (projectData['owner'] ?? '').toString(),
                'status': (projectData['status'] ?? 'Open').toString(),
              },
              projectDocs[index].id,
            );
          },
        );
      },
    );
  }

  // Project Card
  Widget projectCard(
      Map<String, String> project, String documentId) {
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
              deleteProject(documentId);
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

