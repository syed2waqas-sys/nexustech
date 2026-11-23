
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';
import 'package:nexustech/view/auth/login.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTap;

  const Navbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              widget.onItemTap(0);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.people_outline,
                  color: widget.selectedIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                Text(
                  'Users',
                  style: TextStyle(
                    color: widget.selectedIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              widget.onItemTap(1);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.work_outline,
                  color: widget.selectedIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                Text(
                  'Projects',
                  style: TextStyle(
                    color: widget.selectedIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.logout,
                  color: AppColors.greyColor,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
