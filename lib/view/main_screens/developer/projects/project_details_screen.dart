
import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F6F2),

      body: SafeArea(
        child: Column(
          children: [

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Back Arrow
                      Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Colors.grey,
                      ),

                      SizedBox(height: 18),

                      // Project Status and Category
                      Row(
                        children: [

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffE7E5FF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Open",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.indigo,
                              ),
                            ),
                          ),

                          SizedBox(width: 6),

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
                        ],
                      ),

                      SizedBox(height: 10),

                      // Project Title
                      Text(
                        "Inventory tracker\nfor my bakery",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),

                      SizedBox(height: 12),

                      // Client Information Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffE2E0DC),
                          ),
                        ),

                        child: Row(
                          children: [

                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Color(0xffE7E5FF),
                              child: Text(
                                "AK",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Ayesha Khan",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 3),

                                Text(
                                  "Client, posted 2 days ago",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12),

                      // Budget and Proposals Cards
                      Row(
                        children: [

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),

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

                                  Text(
                                    "Client budget",
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "\$400 to \$600",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 8),

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),

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

                                  Text(
                                    "Proposals so far",
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "6",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // About Project Heading
                      Text(
                        "About this project",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 7),

                      // Project Description
                      Text(
                        "I run a small bakery and want a simple app to "
                        "log daily stock, flag items running low, and "
                        "see what sold best each week. Android first, "
                        "iOS later.",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: 14),

                      // Information Box
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Color(0xffE7E5FF),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Icon(
                              Icons.info_outline,
                              size: 15,
                              color: Colors.indigo,
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                "You can apply once per project. The client "
                                "sees your message, your expected budget "
                                "and your GitHub link.",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.indigo,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Apply Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color(0xffE2E0DC),
                  ),
                ),
              ),

              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 13),

                decoration: BoxDecoration(
                  color: Color(0xff3939D5),
                  borderRadius: BorderRadius.circular(9),
                ),

                child: Center(
                  child: Text(
                    "Apply to this project",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
