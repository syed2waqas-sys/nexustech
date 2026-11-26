import 'package:flutter/material.dart';

class ClientProjectsData {
  static final ValueNotifier<List<Map<String, dynamic>>> projects =
      ValueNotifier([
    {
      'status': 'Open',
      'date': 'Posted 2 days ago',
      'title': 'Inventory tracker for my bakery',
      'category': 'Mobile app',
      'price': '\$400 to \$600',
      'extra': '6 proposals',
      'description': '',
      'budgetFrom': 400,
      'budgetTo': 600,
      'posted': 'Posted 2 days ago',
      'proposals': 6,
    },
    {
      'status': 'In Progress',
      'date': 'Started 5 days ago',
      'title': 'Portfolio site for photography students',
      'category': 'Web development',
      'price': '\$250',
      'extra': 'with Hamza R.',
      'description': '',
      'budgetFrom': 250,
      'budgetTo': 250,
      'posted': 'Started 5 days ago',
      'proposals': 0,
    },
    {
      'status': 'Completed',
      'date': 'Closed 3 weeks ago',
      'title': 'Landing page for the society fest',
      'category': 'UI/UX design',
      'price': '\$120',
      'extra': 'with Sana M.',
      'description': '',
      'budgetFrom': 120,
      'budgetTo': 120,
      'posted': 'Closed 3 weeks ago',
      'proposals': 0,
    },
  ]);

  static void addProject(Map<String, dynamic> project) {
    final newProject = Map<String, dynamic>.from(project);

    newProject['date'] = 'Posted just now';
    newProject['price'] =
        '\$${newProject['budgetFrom']} to \$${newProject['budgetTo']}';
    newProject['extra'] = '${newProject['proposals'] ?? 0} proposals';

    projects.value = [...projects.value, newProject];
  }
}