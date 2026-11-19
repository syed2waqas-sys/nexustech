import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/projects/project_detail_screen.dart';
import 'package:nexustech/widgets/custom_button.dart';
import 'package:nexustech/widgets/custom_textfield.dart';

class Project_Screen extends StatefulWidget {
  const Project_Screen({super.key});

  @override
  State<Project_Screen> createState() => _Project_ScreenState();
}

class _Project_ScreenState extends State<Project_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Post a Project",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Project Title
                const Text(
                  "Project title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),

                const SizedBox(height: 8),

                const CustomTextField(
                  hintText: "Inventory tracker for my bakery",
                ),

                const SizedBox(height: 15),

                // Category
                const Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),

                const SizedBox(height: 10),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    ChoiceChip(
                      label: Text("Mobile Development"),
                      selected: true,
                    ),

                    ChoiceChip(label: Text("Web Development"), selected: false),

                    ChoiceChip(label: Text("UI/UX Design"), selected: false),

                    ChoiceChip(label: Text("Data and AI"), selected: false),

                    ChoiceChip(label: Text("Games"), selected: false),

                    ChoiceChip(label: Text("Others"), selected: false),
                  ],
                ),

                const SizedBox(height: 15),

                // Description
                const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),

                const SizedBox(height: 8),

                const CustomTextField(
                  hintText: "I run a small bakery and want a simple app to log daily stock, flag items running low, and see what sold best each week. Android first, iOS later.",
                  maxLines: 5,
                ),

                const SizedBox(height: 15),

                // Budget
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Budget From",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 8),

                          const CustomTextField(
                            hintText: "\$ 400",
                            isNumberInput: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Budget To",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 8),

                          const CustomTextField(
                            hintText: "\$ 600",
                            isNumberInput: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Publish Project Button
                CustomButton(
                  buttonColor: AppColors.primaryColor,
                  buttonText: "Publish Project",
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  onButtonTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectDetailScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
