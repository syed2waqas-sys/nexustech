
import 'package:flutter/material.dart';
import 'package:nexustech/view/main_screens/developer/proposals/my_application.dart';

class ApplyProject extends StatefulWidget {
  const ApplyProject({super.key});

  @override
  State<ApplyProject> createState() => _ApplyProjectState();
}

class _ApplyProjectState extends State<ApplyProject> {

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
                  padding: EdgeInsets.all(12),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // App Bar
                      Row(
                        children: [

                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Apply to project",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 18),

                      // Project Information Card
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

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Inventory tracker for my bakery",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 3),

                            Text(
                              "Mobile app, client budget \$400 to \$600",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 14),

                      // Your Message Heading
                      Text(
                        "Your message",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 7),

                      // Message Text Field
                      Container(
                        height: 115,
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xff3939DD),
                          ),
                        ),

                        child: Text(
                          "I have built two Flutter stock apps for local shops using Firebase. "
                          "I can ship a working Android build in three weeks and hand over the full source.",
                          style: TextStyle(
                            fontSize: 11,
                            height: 1.4,
                          ),
                        ),
                      ),

                      SizedBox(height: 5),

                      // Message Hint and Character Count
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Say why you are a fit. Keep it specific.",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            "148 / 500",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14),

                      // Expected Budget Heading
                      Text(
                        "Expected budget",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 7),

                      // Budget Field
                      Container(
                        height: 42,
                        padding: EdgeInsets.symmetric(horizontal: 10),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),

                        child: Row(
                          children: [

                            Text(
                              "\$",
                              style: TextStyle(fontSize: 12),
                            ),

                            SizedBox(width: 8),

                            Text(
                              "450",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      // GitHub Information Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffE2E0DC),
                          ),
                        ),

                        child: Row(
                          children: [

                            Icon(
                              Icons.code,
                              color: Colors.indigo,
                              size: 16,
                            ),

                            SizedBox(width: 8),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Your GitHub link goes with this proposal",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey,
                                  ),
                                ),

                                SizedBox(height: 3),

                                Text(
                                  "github.com/hamza-r",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Send Proposal Section
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

              child: Column(
                children: [

                  // Send Proposal Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApplications(),
                        ),
                      );
                    },

                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),

                      decoration: BoxDecoration(
                        color: Color(0xff3939D5),
                        borderRadius: BorderRadius.circular(9),
                      ),

                      child: Center(
                        child: Text(
                          "Send proposal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 7),

                  Text(
                    "One proposal per project. You cannot edit it after\nsending.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
