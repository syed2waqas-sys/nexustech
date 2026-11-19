
import 'package:flutter/material.dart';

class ManageProjects extends StatefulWidget {
  const ManageProjects({super.key});

  @override
  State<ManageProjects> createState() => _ManageProjectsState();
}

class _ManageProjectsState extends State<ManageProjects> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4F0),
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
                  'Manage projects',
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
              Icons.person_outline,
              color: Colors.white,
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  // Search Bar
  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by title or owner',
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

  // Project List
  Widget projectList() {
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

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return projectCard(projects[index]);
      },
    );
  }

  // Project Card
  Widget projectCard(Map<String, String> project) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E2DD),
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
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.delete_outline,
            color: Colors.red,
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
