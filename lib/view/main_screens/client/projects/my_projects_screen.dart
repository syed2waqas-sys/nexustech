
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/projects/project_detail_screen.dart';
import 'package:nexustech/widgets/custom_button.dart';
import 'package:nexustech/widgets/custom_textfield.dart';

class Project_Screen extends StatefulWidget {
  final Map<String, dynamic>? project;

  const Project_Screen({super.key, this.project});

  @override
  State<Project_Screen> createState() => _Project_ScreenState();
}

class _Project_ScreenState extends State<Project_Screen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController budgetFromController = TextEditingController();
  final TextEditingController budgetToController = TextEditingController();

  final List<String> categories = [
    "Mobile app",
    "Web development",
    "UI/UX design",
    "Data and AI",
    "Games",
    "Other",
  ];

  String selectedCategory = "Mobile app";

  bool get isEditing => widget.project != null;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      titleController.text = widget.project!['title'] ?? '';
      descriptionController.text = widget.project!['description'] ?? '';
      budgetFromController.text =
          widget.project!['budgetFrom']?.toString() ?? '';
      budgetToController.text =
          widget.project!['budgetTo']?.toString() ?? '';

      if (categories.contains(widget.project!['category'])) {
        selectedCategory = widget.project!['category'];
      }
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    budgetFromController.dispose();
    budgetToController.dispose();
    super.dispose();
  }

  void submitProject() {
    if (titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        budgetFromController.text.trim().isEmpty ||
        budgetToController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final double? minimumBudget = double.tryParse(
      budgetFromController.text.trim().replaceAll(',', ''),
    );

    final double? maximumBudget = double.tryParse(
      budgetToController.text.trim().replaceAll(',', ''),
    );

    if (minimumBudget == null ||
        maximumBudget == null ||
        minimumBudget < 0 ||
        maximumBudget < minimumBudget) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid budget range")),
      );
      return;
    }

    final Map<String, dynamic> projectData = {
      'title': titleController.text.trim(),
      'category': selectedCategory,
      'description': descriptionController.text.trim(),
      'budgetFrom': minimumBudget,
      'budgetTo': maximumBudget,
      'status': widget.project?['status'] ?? 'Open',
      'posted': widget.project?['posted'] ?? 'Posted just now by you',
      'proposals': widget.project?['proposals'] ?? 0,
    };

    if (isEditing) {
      Navigator.pop(context, projectData);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectDetailScreen(project: projectData),
        ),
      );
    }
  }

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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isEditing ? "Edit Project" : "Post a Project",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Project title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  textFieldController: titleController,
                  hintText: "Inventory tracker for my bakery",
                ),
                const SizedBox(height: 15),
                const Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: categories.map((category) {
                    return ChoiceChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedCategory = category;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  textFieldController: descriptionController,
                  hintText:
                      "I run a small bakery and want a simple app to log daily stock, flag items running low, and see what sold best each week. Android first, iOS later.",
                  maxLines: 5,
                ),
                const SizedBox(height: 15),
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
                          CustomTextField(
                            textFieldController: budgetFromController,
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
                          CustomTextField(
                            textFieldController: budgetToController,
                            hintText: "\$ 600",
                            isNumberInput: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                CustomButton(
                  buttonColor: AppColors.primaryColor,
                  buttonText: isEditing ? "Save changes" : "Publish project",
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  onButtonTap: submitProject,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
