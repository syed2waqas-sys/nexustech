
import 'package:flutter/material.dart';

class BrowseProjects extends StatelessWidget {
  const BrowseProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F6F2),

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
                  ),
                ),

                SizedBox(height: 14),

                // Search Bar
                Container(
                  height: 42,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),

                  child: Row(
                    children: [
                      Icon(Icons.search, size: 16),
                      SizedBox(width: 8),

                      Text(
                        "flutter",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
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
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 10),

                // Project 1
                projectCard(
                  "2 days ago",
                  "Inventory tracker for my bakery",
                  "\$400 to \$600",
                  "6 proposals",
                ),

                SizedBox(height: 8),

                // Project 2
                projectCard(
                  "4 days ago",
                  "Quiz app for a school society",
                  "\$300 to \$450",
                  "2 proposals",
                ),

                SizedBox(height: 8),

                // Project 3
                projectCard(
                  "6 days ago",
                  "Habit tracker with weekly streaks",
                  "\$200 to \$350",
                  "9 proposals",
                ),

                SizedBox(height: 8),

                // Project 4
                projectCard(
                  "1 week ago",
                  "Booking app for a campus gym",
                  "\$500 to \$800",
                  "No proposals yet",
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
        color: selected ? Color(0xff3036C9) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? Color(0xff3036C9) : Colors.grey.shade400,
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          fontSize: 10,
          color: selected ? Colors.white : Colors.black,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xffE2E0DC),
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
                  style: TextStyle(fontSize: 9),
                ),
              ),

              Text(
                time,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
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
            ),
          ),

          SizedBox(height: 5),

          // Price and Proposals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                price,
                style: TextStyle(fontSize: 10),
              ),

              Text(
                proposals,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
