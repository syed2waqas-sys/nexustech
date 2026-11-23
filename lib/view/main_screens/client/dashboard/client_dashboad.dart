
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';
import 'package:nexustech/view/main_screens/client/proposals/received_proposal_screen.dart';
import 'package:nexustech/view/main_screens/profile/client_profile_screen.dart';
import 'package:nexustech/widgets/custom_button.dart';
import 'package:nexustech/widgets/client_navbar.dart';


class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final Color backgroundColor = const Color(0xFFF7F6F2);
  final Color primaryColor = const Color(0xFF3535D5);
  final Color borderColor = const Color(0xFFE5E3DE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(child: _statCard('2', 'Open')),
                    const SizedBox(width: 10),
                    Expanded(child: _statCard('1', 'In progress')),
                    const SizedBox(width: 10),
                    Expanded(child: _statCard('4', 'Completed')),
                  ],
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'My projects',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF3535D5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                _projectCard(
                  status: 'Open',
                  statusColor: const Color(0xFFE8E9FF),
                  statusTextColor: const Color(0xFF3535D5),
                  date: 'Posted 2 days ago',
                  title: 'Inventory tracker for my bakery',
                  category: 'Mobile app',
                  price: '\$400 to \$600',
                  extra: '6 proposals',
                ),

                const SizedBox(height: 12),

                _projectCard(
                  status: 'In Progress',
                  statusColor: const Color(0xFFDDF2FF),
                  statusTextColor: const Color(0xFF1682B8),
                  date: 'Started 5 days ago',
                  title: 'Portfolio site for photography students',
                  category: 'Web development',
                  price: '\$250',
                  extra: 'with Hamza R.',
                ),

                const SizedBox(height: 12),

                _projectCard(
                  status: 'Completed',
                  statusColor: const Color(0xFFDDF5E6),
                  statusTextColor: const Color(0xFF21834C),
                  date: 'Closed 3 weeks ago',
                  title: 'Landing page for the society fest',
                  category: 'UI/UX design',
                  price: '\$120',
                  extra: 'with Sana M.',
                ),

                const SizedBox(height: 35),

                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 150,
                    child: CustomButton(
                      buttonColor: primaryColor,
                      textColor: AppColors.whiteColor,
                      buttonText: '+ Post project',
                      height: 45,
                      borderRadius: 25,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      onButtonTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Project_Screen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClientNavbar(
        selectedIndex: 0,
        onItemTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Project_Screen(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProposalsScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ClientProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Good morning',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              'Ayesha Khan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFE9E9FF),
          child: Text(
            'AK',
            style: TextStyle(
              color: Color(0xFF3535D5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statCard(String number, String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _projectCard({
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required String date,
    required String title,
    required String category,
    required String price,
    required String extra,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 10,
                    color: statusTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                extra,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
