
import 'package:flutter/material.dart';
import '../../../../controller/manage_projects_controller.dart';
import '../../../../model/project_model.dart';

class ManageProjectsScreen extends StatefulWidget {
  const ManageProjectsScreen({super.key});

  @override
  State<ManageProjectsScreen> createState() =>
      _ManageProjectsScreenState();
}

class _ManageProjectsScreenState
    extends State<ManageProjectsScreen> {

  final ManageProjectsController controller =
      ManageProjectsController();

  final Color primaryColor = const Color(0xFF4145FF);
  final Color backgroundColor = const Color(0xFFF5F5F5);
  final Color borderColor = const Color(0xFFE1E1E1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {

        return Scaffold(
          backgroundColor: backgroundColor,

          body: SafeArea(
            child: Column(
              children: [

                // Header
                _header(),

                // Tabs
                _tabs(),

                // Search
                _searchBar(),

                // Projects
                Expanded(
                  child: _projectList(),
                ),

              ],
            ),
          ),

          // Bottom Navigation
          bottomNavigationBar: _bottomNavigation(),
        );
      },
    );
  }

  // HEADER
  Widget _header() {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  'Admin dashboard',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),

                const Text(
                  'Manage projects',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),

          Container(
            height: 36,
            width: 36,

            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              borderRadius: BorderRadius.circular(9),
            ),

            child: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 19,
            ),
          ),

        ],
      ),
    );
  }

  // TABS
  Widget _tabs() {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),

      padding: const EdgeInsets.all(4),

      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(9),
      ),

      child: Row(
        children: [

          _tabButton('Users', 0),

          _tabButton('Projects', 1),

        ],
      ),
    );
  }

  Widget _tabButton(String title, int index) {

    bool isSelected = controller.selectedTab == index;

    return Expanded(
      child: InkWell(

        onTap: () {
          controller.changeTab(index);
        },

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9),

          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white
                : Colors.transparent,

            borderRadius: BorderRadius.circular(8),
          ),

          child: Text(
            title,

            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  // SEARCH BAR
  Widget _searchBar() {

    return Container(
      height: 40,

      margin: const EdgeInsets.all(16),

      padding: const EdgeInsets.symmetric(horizontal: 12),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          const Icon(
            Icons.search,
            size: 18,
            color: Colors.grey,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: TextField(

              onChanged: (value) {
                controller.searchProjects(value);
              },

              decoration: const InputDecoration(
                hintText: 'Search by title or owner',
                hintStyle: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

        ],
      ),
    );
  }

  // PROJECT LIST
  Widget _projectList() {

    List<ProjectModel> projectList =
        controller.filteredProjects;

    return ListView.builder(

      padding: const EdgeInsets.symmetric(horizontal: 10),

      itemCount: projectList.length,

      itemBuilder: (context, index) {

        ProjectModel project = projectList[index];

        return _projectCard(project, index);
      },
    );
  }

  // PROJECT CARD
  Widget _projectCard(ProjectModel project, int index) {

    return Container(
      margin: const EdgeInsets.only(bottom: 8),

      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  project.title,

                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [

                    _statusBadge(project.status),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        'by ${project.owner}',

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          const SizedBox(width: 8),

          // DELETE BUTTON
          InkWell(
            onTap: () {
              controller.deleteProject(index);
            },

            child: Container(
              height: 30,
              width: 30,

              decoration: BoxDecoration(
                color: const Color(0xFFFCE6E3),
                borderRadius: BorderRadius.circular(7),
              ),

              child: const Icon(
                Icons.delete_outline,
                size: 17,
                color: Color(0xFFB94A42),
              ),
            ),
          ),

        ],
      ),
    );
  }

  // STATUS BADGE
  Widget _statusBadge(String status) {

    Color badgeColor;
    Color textColor;

    switch (status) {

      case 'Open':
        badgeColor = const Color(0xFFE8E8FF);
        textColor = const Color(0xFF4145FF);
        break;

      case 'In Progress':
        badgeColor = const Color(0xFFE4EDFF);
        textColor = Colors.blue;
        break;

      case 'Completed':
        badgeColor = const Color(0xFFDDF5E7);
        textColor = Colors.green;
        break;

      default:
        badgeColor = const Color(0xFFEAEAEA);
        textColor = Colors.black54;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 3,
      ),

      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(5),
      ),

      child: Text(
        status,

        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  // BOTTOM NAVIGATION
  Widget _bottomNavigation() {

    return Container(
      height: 55,

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border(
          top: BorderSide(color: borderColor),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [

          _navItem(
            Icons.people_outline,
            'Users',
            0,
          ),

          _navItem(
            Icons.work_outline,
            'Projects',
            1,
          ),

          _navItem(
            Icons.logout,
            'Log out',
            2,
          ),

        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String title,
    int index,
  ) {

    bool isSelected = index == 1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Icon(
          icon,
          size: 17,
          color: isSelected
              ? primaryColor
              : Colors.blueGrey,
        ),

        const SizedBox(height: 3),

        Text(
          title,

          style: TextStyle(
            fontSize: 9,
            color: isSelected
                ? primaryColor
                : Colors.blueGrey,
          ),
        ),

      ],
    );
  }
}
