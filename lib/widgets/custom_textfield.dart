
import 'package:nexustech/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onSuffixTap;
  final bool? isObscure;
  final TextEditingController? textFieldController;
  final bool showBorder;
  final bool isNumberInput;
  final int? maxLines;

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.isObscure,
    this.showBorder = true,
    this.isNumberInput = false,
    this.textFieldController,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      keyboardType: isNumberInput ? TextInputType.number : TextInputType.text,
      obscureText: isObscure ?? false,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.greyColor)
            : null,
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onSuffixTap,
                child: Icon(suffixIcon, color: AppColors.greyColor),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: showBorder ? AppColors.borderColor : Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: showBorder ? AppColors.primaryColor : Colors.transparent,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
