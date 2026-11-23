import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';

class DeveloperNavbar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTap;

  const DeveloperNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  State<DeveloperNavbar> createState() => _DeveloperNavbarState();
}

class _DeveloperNavbarState extends State<DeveloperNavbar> {
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
                  Icons.home_outlined,
                  color: widget.selectedIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                Text(
                  'Home',
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
                  Icons.search,
                  color: widget.selectedIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                Text(
                  'Browse',
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
              widget.onItemTap(2);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.description_outlined,
                  color: widget.selectedIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                Text(
                  'Applications',
                  style: TextStyle(
                    color: widget.selectedIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              widget.onItemTap(3);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_outline,
                  color: widget.selectedIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: widget.selectedIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
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