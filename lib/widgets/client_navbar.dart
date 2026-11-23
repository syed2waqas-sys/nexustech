import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';

class ClientNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTap;

  const ClientNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
          top: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, "Home", 0),
          _navItem(Icons.add_box_outlined, "Post", 1),
          _navItem(Icons.description_outlined, "Proposal", 2),
          _navItem(Icons.person_outline, "Profile", 3),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 22,
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.greyColor,
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}