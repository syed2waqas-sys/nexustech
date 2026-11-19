
import 'package:flutter/material.dart';
import 'package:nexustech/view_models/project_viewmodel.dart';

class ManageProjectsController extends ChangeNotifier {

  int selectedTab = 1;

  String searchText = '';

  List<ProjectModel> projects = [
    ProjectModel(
      title: 'Inventory tracker for my bakery',
      owner: 'Ayasha Khan',
      status: 'Open',
    ),
    ProjectModel(
      title: 'Portfolio site for photography studio',
      owner: 'Ayasha Khan',
      status: 'In Progress',
    ),
    ProjectModel(
      title: 'Quiz app for a school society',
      owner: 'Bilal Ahmed',
      status: 'Open',
    ),
    ProjectModel(
      title: 'Landing page for the society fest',
      owner: 'Ayasha Khan',
      status: 'Completed',
    ),
    ProjectModel(
      title: 'Booking app for a campus gym',
      owner: 'Zara Iqbal',
      status: 'Closed',
    ),
    ProjectModel(
      title: 'Habit tracker with weekly streaks',
      owner: 'Zara Iqbal',
      status: 'Open',
    ),
  ];

  // Change selected tab
  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  // Search projects
  void searchProjects(String value) {
    searchText = value;
    notifyListeners();
  }

  // Get filtered projects
  List<ProjectModel> get filteredProjects {

    return projects.where((project) {

      return project.title.toLowerCase().contains(
            searchText.toLowerCase(),
          ) ||
          project.owner.toLowerCase().contains(
            searchText.toLowerCase(),
          );

    }).toList();
  }

  // Delete project
  void deleteProject(int index) {
    ProjectModel project = filteredProjects[index];

    projects.remove(project);

    notifyListeners();
  }
}
