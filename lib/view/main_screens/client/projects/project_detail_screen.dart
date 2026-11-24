
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/view/main_screens/client/proposals/received_proposal_screen.dart';
import 'package:nexustech/widgets/custom_button.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Map<String, dynamic>? project;

  const ProjectDetailScreen({super.key, this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  late Map<String, dynamic> project;

  @override
  void initState() {
    super.initState();

    project = widget.project ?? {
      'title': 'Inventory tracker for my bakery',
      'status': 'Open',
      'posted': 'Posted 2 days ago by you',
      'budgetFrom': 400,
      'budgetTo': 600,
      'category': 'Mobile app',
      'proposals': 6,
      'description':
          'I run a small bakery and want a simple app to log daily stock, flag items running low, and see what sold best each week. Android first, iOS later.',
    };
  }

  @override
  Widget build(BuildContext context) {
    final String status = project['status'] ?? 'Open';
    final String title = project['title'] ?? '';
    final String posted = project['posted'] ?? 'Posted 2 days ago by you';
    final String category = project['category'] ?? 'Mobile app';
    final int proposals = project['proposals'] ?? 6;
    final String description = project['description'] ??
        'I run a small bakery and want a simple app to log daily stock, flag items running low, and see what sold best each week. Android first, iOS later.';

    final String budgetFrom =
        project['budgetFrom']?.toString() ?? '400';
    final String budgetTo =
        project['budgetTo']?.toString() ?? '600';

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
                      onTap: status == 'Closed'
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Project_Screen(project: project),
                                ),
                              ).then((updatedProject) {
                                if (updatedProject != null &&
                                    updatedProject is Map<String, dynamic>) {
                                  setState(() {
                                    project = updatedProject;
                                  });
                                }
                              });
                            },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: status == 'Closed'
                                ? Colors.grey
                                : Colors.black,
                          ),
                          Text(
                            "edit",
                            style: TextStyle(
                              color: status == 'Closed'
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                        ],
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
                    color: status == 'Closed'
                        ? Colors.grey.shade200
                        : const Color(0xFFE8E9FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(status),
                ),

                const SizedBox(height: 10),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  posted,
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        title: "Budget",
                        value: "\$$budgetFrom to\n\$$budgetTo",
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: StatCard(
                        title: "Category",
                        value: category,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: StatCard(
                        title: "Proposals",
                        value: "$proposals received",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  "About this project",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(description),

                const SizedBox(height: 15),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E9FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "When you accept one proposal, all other proposals will automatically be rejected.",
                  ),
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
                  buttonText: "Review $proposals proposals",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  onButtonTap: status == 'Closed'
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProposalsScreen(),
                            ),
                          );
                        },
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: status == 'Closed'
                      ? null
                      : () {
                          setState(() {
                            project['status'] = 'Closed';
                          });

                          Navigator.pop(context);
                        },
                  child: Text(
                    status == 'Closed' ? "Project Closed" : "Close Project",
                    style: const TextStyle(color: Colors.red),
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
        children: [
          Text(title),
          const SizedBox(height: 8),
          Text(value),
        ],
      ),
    );
  }
}
