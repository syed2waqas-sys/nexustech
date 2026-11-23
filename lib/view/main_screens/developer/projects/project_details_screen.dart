import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/developer/proposals/apply_with_proposal.dart';
import 'package:nexustech/widgets/custom_button.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: AppColors.greyColor,
                        ),
                      ),

                      SizedBox(height: 18),

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
                                color: AppColors.primaryColor,
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

                      Text(
                        "Inventory tracker\nfor my bakery",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          color: AppColors.textColor,
                        ),
                      ),

                      SizedBox(height: 12),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.borderColor,
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
                                  color: AppColors.primaryColor,
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
                                    color: AppColors.textColor,
                                  ),
                                ),

                                SizedBox(height: 3),

                                Text(
                                  "Client, posted 2 days ago",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
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
                                  Text(
                                    "Client budget",
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.greyColor,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "\$400 to \$600",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
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
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.borderColor,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Proposals so far",
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.greyColor,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "6",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      Text(
                        "About this project",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),

                      SizedBox(height: 7),

                      Text(
                        "I run a small bakery and want a simple app to "
                        "log daily stock, flag items running low, and "
                        "see what sold best each week. Android first, "
                        "iOS later.",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          color: AppColors.textColor,
                        ),
                      ),

                      SizedBox(height: 14),

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
                              color: AppColors.primaryColor,
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                "You can apply once per project. The client "
                                "sees your message, your expected budget "
                                "and your GitHub link.",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.primaryColor,
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

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border(
                  top: BorderSide(
                    color: AppColors.borderColor,
                  ),
                ),
              ),
              child: CustomButton(
                buttonColor: AppColors.primaryColor,
                buttonText: "Apply to this project",
                textColor: AppColors.whiteColor,
                height: 42,
                borderRadius: 9,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                onButtonTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ApplyProject(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}