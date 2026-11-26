import 'package:flutter/material.dart';

class AdminProjectsData {
  static final ValueNotifier<List<Map<String, String>>> projects =
      ValueNotifier([
    {
      'title': 'Inventory tracker for my bakery',
      'owner': 'Ayasha Khan',
      'status': 'Open',
    },
    {
      'title': 'Portfolio site for photography studio',
      'owner': 'Ayasha Khan',
      'status': 'In Progress',
    },
    {
      'title': 'Quiz app for a school society',
      'owner': 'Bilal Ahmed',
      'status': 'Open',
    },
    {
      'title': 'Landing page for the society fest',
      'owner': 'Ayasha Khan',
      'status': 'Completed',
    },
    {
      'title': 'Booking app for a campus gym',
      'owner': 'Zara Iqbal',
      'status': 'Closed',
    },
    {
      'title': 'Habit tracker with weekly streaks',
      'owner': 'Zara Iqbal',
      'status': 'Open',
    },
  ]);

  static void addProject(Map<String, String> project) {
    projects.value = [...projects.value, project];
  }

  static void deleteProject(int index) {
    final updatedProjects =
        List<Map<String, String>>.from(projects.value);

    updatedProjects.removeAt(index);
    projects.value = updatedProjects;
  }
}