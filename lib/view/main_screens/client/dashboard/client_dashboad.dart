/*
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/view/main_screens/client/projects/project_detail_screen.dart';
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

  final List<Map<String, dynamic>> projects = [
    {
      'status': 'Open',
      'statusColor': const Color(0xFFE8E9FF),
      'statusTextColor': const Color(0xFF3535D5),
      'date': 'Posted 2 days ago',
      'title': 'Inventory tracker for my bakery',
      'category': 'Mobile app',
      'price': '\$400 to \$600',
      'extra': '6 proposals',
    },
    {
      'status': 'In Progress',
      'statusColor': const Color(0xFFDDF2FF),
      'statusTextColor': const Color(0xFF1682B8),
      'date': 'Started 5 days ago',
      'title': 'Portfolio site for photography students',
      'category': 'Web development',
      'price': '\$250',
      'extra': 'with Hamza R.',
    },
    {
      'status': 'Completed',
      'statusColor': const Color(0xFFDDF5E6),
      'statusTextColor': const Color(0xFF21834C),
      'date': 'Closed 3 weeks ago',
      'title': 'Landing page for the society fest',
      'category': 'UI/UX design',
      'price': '\$120',
      'extra': 'with Sana M.',
    },
  ];

  int get openCount =>
      projects.where((project) => project['status'] == 'Open').length;

  int get inProgressCount =>
      projects.where((project) => project['status'] == 'In Progress').length;

  int get completedCount =>
      projects.where((project) => project['status'] == 'Completed').length;

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

                Row(
                  children: [
                    Expanded(child: _statCard('$openCount', 'Open')),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _statCard('$inProgressCount', 'In progress'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _statCard('$completedCount', 'Completed'),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'My projects',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF3535D5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                for (int i = 0; i < projects.length; i++) ...[
                  _projectCard(
                    status: projects[i]['status'],
                    statusColor: projects[i]['statusColor'],
                    statusTextColor: projects[i]['statusTextColor'],
                    date: projects[i]['date'],
                    title: projects[i]['title'],
                    category: projects[i]['category'],
                    price: projects[i]['price'],
                    extra: projects[i]['extra'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProjectDetailScreen(),
                        ),
                      );
                    },
                  ),
                  if (i != projects.length - 1)
                    const SizedBox(height: 12),
                ],

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
                      onButtonTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Project_Screen(),
                          ),
                        );
                      },
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
              'Ayesha Khan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFE9E9FF),
          child: Text(
            'AK',
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
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
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
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
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
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/


/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/view/main_screens/client/projects/project_detail_screen.dart';
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

  // Get the currently logged-in client UID
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  // Fetch only projects posted by the current client
  Stream<QuerySnapshot<Map<String, dynamic>>> get projectsStream {
    return FirebaseFirestore.instance
        .collection('projects')
        .where('clientId', isEqualTo: uid)
        .snapshots();
  }

  // Fetch current client profile
  Stream<DocumentSnapshot<Map<String, dynamic>>> get userStream {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: uid == null
            ? const Center(child: Text('Please login first'))
            : StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: userStream,
                builder: (context, userSnapshot) {
                  String clientName = 'Client';

                  if (userSnapshot.hasData &&
                      userSnapshot.data!.exists) {
                    clientName =
                        userSnapshot.data!.data()?['name'] ?? 'Client';
                  }

                  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: projectsStream,
                    builder: (context, projectSnapshot) {
                      if (projectSnapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${projectSnapshot.error}',
                          ),
                        );
                      }

                      if (projectSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final documents =
                          projectSnapshot.data?.docs ?? [];

                      // Convert Firestore documents into a list
                      final projects = documents.map((doc) {
                        return {
                          ...doc.data(),
                          'id': doc.id,
                        };
                      }).toList();

                      // Calculate project statistics
                      final openCount = projects.where((project) =>
                          (project['status'] ?? '')
                              .toString()
                              .toLowerCase() == 'open').length;

                      final inProgressCount = projects.where((project) =>
                          (project['status'] ?? '')
                              .toString()
                              .toLowerCase() == 'in progress').length;

                      final completedCount = projects.where((project) =>
                          (project['status'] ?? '')
                              .toString()
                              .toLowerCase() == 'completed').length;

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              _header(clientName),

                              const SizedBox(height: 20),

                              Row(
                                children: [
                                  Expanded(
                                    child: _statCard(
                                      '$openCount',
                                      'Open',
                                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'My projects',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'See all',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF3535D5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              if (projects.isEmpty)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(25),
                                    child: Text(
                                      'You have not posted any projects yet.',
                                    ),
                                  ),
                                ),

                              for (int i = 0;
                                  i < projects.length;
                                  i++) ...[
                                _projectCard(
                                  project: projects[i],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProjectDetailScreen(),
                                      ),
                                    );
                                  },
                                ),

                                if (i != projects.length - 1)
                                  const SizedBox(height: 12),
                              ],

                              const SizedBox(height: 35),

                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 150,
                                  child: CustomButton(
                                    buttonColor: primaryColor,
                                    textColor:
                                        AppColors.whiteColor,
                                    buttonText: '+ Post project',
                                    height: 45,
                                    borderRadius: 25,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    onButtonTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Project_Screen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),

      bottomNavigationBar: ClientNavbar(
        selectedIndex: 0,
        onItemTap: (index) {
          if (index == 1) {
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

  // Header with Firestore name
  Widget _header(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good morning',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFE9E9FF),
          child: Text(
            name.isNotEmpty
                ? name.trim().split(' ').map((e) => e[0]).take(2).join().toUpperCase()
                : 'C',
            style: const TextStyle(
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
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Dynamic project card
  Widget _projectCard({
    required Map<String, dynamic> project,
    required VoidCallback onTap,
  }) {
    final String status = project['status'] ?? 'Open';

    Color statusColor = const Color(0xFFE8E9FF);
    Color statusTextColor = const Color(0xFF3535D5);

    if (status.toLowerCase() == 'in progress') {
      statusColor = const Color(0xFFDDF2FF);
      statusTextColor = const Color(0xFF1682B8);
    } else if (status.toLowerCase() == 'completed') {
      statusColor = const Color(0xFFDDF5E6);
      statusTextColor = const Color(0xFF21834C);
    }

    String date = 'Recently posted';

    final createdAt = project['createdAt'];

    if (createdAt is Timestamp) {
      final difference =
          DateTime.now().difference(createdAt.toDate());

      if (difference.inDays > 0) {
        date = 'Posted ${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        date = 'Posted ${difference.inHours} hours ago';
      } else {
        date = 'Posted recently';
      }
    }

    final String title = project['title'] ?? 'Untitled project';
    final String category = project['category'] ?? 'Other';

    // Display budget from Firestore
    String price = project['budget']?.toString() ?? '';

    if (price.isEmpty &&
        project['budgetMin'] != null &&
        project['budgetMax'] != null) {
      price = '\$${project['budgetMin']} - \$${project['budgetMax']}';
    }

    final String extra =
        '${project['proposalsCount'] ?? 0} proposals';

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
*/





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/widgets/client_navbar.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {

  int selectedIndex = 0;

  // Fetch ALL projects from Firestore
  final Stream<QuerySnapshot<Map<String, dynamic>>> projectsStream =
      FirebaseFirestore.instance.collection('projects').snapshots();

  // Fetch logged-in user's data
  final User? currentUser = FirebaseAuth.instance.currentUser;

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

              // Header
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: currentUser == null
                    ? null
                    : FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentUser!.uid)
                        .snapshots(),

                builder: (context, snapshot) {

                  String name = 'Client';

                  if (snapshot.hasData &&
                      snapshot.data!.exists) {
                    name = snapshot.data!.data()?['name'] ?? 'Client';
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Good morning',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      CircleAvatar(
                        backgroundColor: Colors.indigo.shade50,

                        child: Text(
                          name.isNotEmpty
                              ? name[0].toUpperCase()
                              : 'C',

                          style: const TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              // Projects and Statistics
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: projectsStream,

                  builder: (context, snapshot) {

                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No projects found'),
                      );
                    }

                    // Fetch ALL documents
                    final documents = snapshot.data!.docs;

                    final projects = documents.map((doc) {
                      return doc.data();
                    }).toList();

                    // Open projects count
                    int openCount = projects.where((project) {
                      return (project['status'] ?? '')
                          .toString()
                          .trim()
                          .toLowerCase() == 'open';
                    }).length;

                    // In progress count
                    int inProgressCount = projects.where((project) {
                      return (project['status'] ?? '')
                          .toString()
                          .trim()
                          .toLowerCase() == 'in progress';
                    }).length;

                    // Completed count
                    int completedCount = projects.where((project) {
                      return (project['status'] ?? '')
                          .toString()
                          .trim()
                          .toLowerCase() == 'completed';
                    }).length;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Statistics
                        Row(
                          children: [

                            Expanded(
                              child: _statCard(
                                openCount.toString(),
                                'Open',
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: _statCard(
                                inProgressCount.toString(),
                                'In progress',
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: _statCard(
                                completedCount.toString(),
                                'Completed',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // My projects heading
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                          children: [

                            const Text(
                              'My projects',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Project_Screen(),
                                  ),
                                );
                              },

                              child: const Text('See all'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // All projects from Firestore
                        Expanded(
                          child: projects.isEmpty
                              ? const Center(
                                  child: Text(
                                    'No projects available',
                                  ),
                                )

                              : ListView.builder(
                                  itemCount: projects.length,

                                  itemBuilder: (context, index) {

                                    final project =
                                        projects[index];

                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(
                                        bottom: 12,
                                      ),

                                      child: _projectCard(
                                        project: project,
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // Post project button
              Align(
                alignment: Alignment.centerRight,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Project_Screen(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: const Text(
                    '+ Post project',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: ClientNavbar(
        selectedIndex: selectedIndex,

        onItemTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Project_Screen(),
              ),
            );
          }
        },
      ),
    );
  }

  // Statistics card
  Widget _statCard(String count, String title) {

    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.whiteColor,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            count,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Project card
  Widget _projectCard({
    required Map<String, dynamic> project,
  }) {

    String status = (project['status'] ?? 'open')
        .toString();

    Color statusColor = AppColors.primaryColor;

    if (status.toLowerCase() == 'completed') {
      statusColor = Colors.green;
    } else if (status.toLowerCase() == 'in progress') {
      statusColor = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.whiteColor,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Status and date
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 11,
                  ),
                ),
              ),

              const Text(
                'Recently posted',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Project title
          Text(
            project['title'] ?? 'Untitled project',

            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 12),

          // Category and proposals
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Text(
                project['category'] ?? 'Other',

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),

              Text(
                '${project['proposalsCount'] ?? 0} proposals',

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
