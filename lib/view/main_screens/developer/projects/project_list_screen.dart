import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/developer/projects/project_details_screen.dart';
import 'package:nexustech/widgets/custom_textfield.dart';

class BrowseProjects extends StatefulWidget {
  const BrowseProjects({super.key});

  @override
  State<BrowseProjects> createState() => _BrowseProjectsState();
}

class _BrowseProjectsState extends State<BrowseProjects> {

  // Navigate to Project Details
  void openProjectDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetails(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Screen Heading
                Text(
                  "Browse projects",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),

                SizedBox(height: 14),

                // Search Bar
                CustomTextField(
                  hintText: "Search projects",
                  prefixIcon: Icons.search,
                  showBorder: true,
                ),

                SizedBox(height: 10),

                // Category Buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    children: [

                      categoryButton("All", false),

                      SizedBox(width: 6),

                      categoryButton("Mobile app", true),

                      SizedBox(width: 6),

                      categoryButton("Web development", false),

                      SizedBox(width: 6),

                      categoryButton("UI/UX", false),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                // Projects Count
                Text(
                  "24 open projects, newest first",
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.greyColor,
                  ),
                ),

                SizedBox(height: 10),

                // Project 1
                GestureDetector(
                  onTap: openProjectDetails,
                  child: projectCard(
                    "2 days ago",
                    "Inventory tracker for my bakery",
                    "\$400 to \$600",
                    "6 proposals",
                  ),
                ),

                SizedBox(height: 8),

                // Project 2
                GestureDetector(
                  onTap: openProjectDetails,
                  child: projectCard(
                    "4 days ago",
                    "Quiz app for a school society",
                    "\$300 to \$450",
                    "2 proposals",
                  ),
                ),

                SizedBox(height: 8),

                // Project 3
                GestureDetector(
                  onTap: openProjectDetails,
                  child: projectCard(
                    "6 days ago",
                    "Habit tracker with weekly streaks",
                    "\$200 to \$350",
                    "9 proposals",
                  ),
                ),

                SizedBox(height: 8),

                // Project 4
                GestureDetector(
                  onTap: openProjectDetails,
                  child: projectCard(
                    "1 week ago",
                    "Booking app for a campus gym",
                    "\$500 to \$800",
                    "No proposals yet",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Category Button
  Widget categoryButton(String title, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),

      decoration: BoxDecoration(
        color: selected
            ? AppColors.primaryColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected
              ? AppColors.primaryColor
              : AppColors.borderColor,
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          fontSize: 10,
          color: selected
              ? AppColors.whiteColor
              : AppColors.textColor,
        ),
      ),
    );
  }

  // Project Card
  Widget projectCard(
    String time,
    String title,
    String price,
    String proposals,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Category and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: Color(0xffEEEEEA),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Text(
                  "Mobile app",
                  style: TextStyle(
                    fontSize: 9,
                    color: AppColors.textColor,
                  ),
                ),
              ),

              Text(
                time,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 7),

          // Project Title
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),

          SizedBox(height: 5),

          // Price and Proposals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                price,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.textColor,
                ),
              ),

              Text(
                proposals,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}