import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yugiapp/app/themes/app_colors.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';
import 'package:yugiapp/app/utils/common.dart';

class GeneralTextFiels extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String text;
  const GeneralTextFiels(
      {super.key,
      this.onChanged,
      required this.controller,
      required this.text,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusColor: Colors.white,
        
        hintStyle: AppTextStyles.base.w200.s16,
        border: OutlineInputBorder(
          
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white)),
        fillColor: AppColors.gray,
        hintText: text,
      ),
      onChanged: onChanged,
      onTapOutside: (event) {
        Common.dismissKeyboard();
      },
    );
  }
}
