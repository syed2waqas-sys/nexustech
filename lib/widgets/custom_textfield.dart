
import 'package:flutter/material.dart';
import 'package:nexustech/utils/app_colors.dart';

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
  final Function(String)? onChanged;

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
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: textFieldController,

      onChanged: onChanged,

      keyboardType: isNumberInput
          ? TextInputType.number
          : TextInputType.text,

      obscureText: isObscure ?? false,

      maxLines: maxLines,

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,

        hintText: hintText,

        hintStyle: const TextStyle(
          fontSize: 11,
          color: AppColors.greyColor,
        ),

        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColors.greyColor,
                size: 17,
              )
            : null,

        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onSuffixTap,
                child: Icon(
                  suffixIcon,
                  color: AppColors.greyColor,
                ),
              )
            : null,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: showBorder
                ? AppColors.borderColor
                : Colors.transparent,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: showBorder
                ? AppColors.primaryColor
                : Colors.transparent,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
