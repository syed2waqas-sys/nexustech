
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F6F2),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),

                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 12),
                        SizedBox(width: 5),
                        Text(
                          "Edit",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18),

              // Profile Information
              Row(
                children: [

                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xffffedc9),
                    child: Text(
                      "HR",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Hamza Raza",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        "hamza.raza@example.com",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 4),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffE7E5FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Developer",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Bio
              Text(
                "Bio",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                "Final-year CS student building Flutter apps on Firebase. "
                "I like small, useful tools for local businesses and student groups.",
                style: TextStyle(
                  fontSize: 11,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 16),

              // Skills
              Text(
                "Skills",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 7),

              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [

                  skillButton("Flutter"),
                  skillButton("Dart"),
                  skillButton("Firebase"),
                  skillButton("Provider"),
                  skillButton("Figma"),
                  skillButton("Git"),
                ],
              ),

              SizedBox(height: 16),

              // GitHub
              Text(
                "GitHub",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 7),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color(0xffE2E0DC),
                  ),
                ),

                child: Row(
                  children: [

                    Icon(
                      Icons.code,
                      size: 16,
                      color: Colors.indigo,
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        "github.com/hamza-r",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 7),

              Text(
                "Clients open this link from your proposals to judge your work.",
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey,
                ),
              ),

              Spacer(),

              // Logout Button
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),

                child: Center(
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Skill Button
  Widget skillButton(String title) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),

      child: Text(
        title,
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
