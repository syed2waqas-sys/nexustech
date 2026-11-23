import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/developer/dashboard/developer_dashboard.dart';
import 'package:nexustech/widgets/developer_nabar.dart';
import 'package:nexustech/view/main_screens/profile/dev_profile_screen.dart';
import 'package:nexustech/view/main_screens/developer/projects/project_list_screen.dart';

class MyApplications extends StatefulWidget {
  const MyApplications({super.key});

  @override
  State<MyApplications> createState() => _MyApplicationsState();
}

class _MyApplicationsState extends State<MyApplications> {
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
                Text(
                  "My applications",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xffEEEEEA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: filterButton("All", true)),
                      Expanded(child: filterButton("Pending", false)),
                      Expanded(child: filterButton("Accepted", false)),
                      Expanded(child: filterButton("Rejected", false)),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                applicationCard(
                  "Inventory tracker for my bakery",
                  "\$450",
                  "Pending",
                  "Sent today",
                  Color(0xffffedc9),
                  Colors.brown,
                ),

                SizedBox(height: 8),

                applicationCard(
                  "Portfolio site for photography students",
                  "\$250",
                  "Accepted",
                  "Project in progress",
                  Color(0xffDDF4E5),
                  Colors.green,
                ),

                SizedBox(height: 8),

                applicationCard(
                  "Habit tracker with weekly streaks",
                  "\$300",
                  "Pending",
                  "Sent 3 days ago",
                  Color(0xffffedc9),
                  Colors.brown,
                ),

                SizedBox(height: 8),

                applicationCard(
                  "Booking app for a campus gym",
                  "\$650",
                  "Rejected",
                  "Client chose another",
                  Color(0xffffdddd),
                  Colors.red,
                ),

                SizedBox(height: 8),

                applicationCard(
                  "Quiz app for a school society",
                  "\$350",
                  "Pending",
                  "Sent 4 days ago",
                  Color(0xffffedc9),
                  Colors.brown,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: DeveloperNavbar(
        selectedIndex: 2,
        onItemTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BrowseProjects(),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget filterButton(String title, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.whiteColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }

  Widget applicationCard(
    String title,
    String price,
    String status,
    String time,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xffE2E0DC),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 9,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your offer $price",
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.greyColor,
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
        ],
      ),
    );
  }
}