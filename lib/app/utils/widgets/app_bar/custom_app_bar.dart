import 'package:flutter/material.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Color? backgroundColor,
    double? elevation,
    Brightness? brightness,
    Action? action, 
    ActionIconThemeData? actionIconThemeData, 
    ActionIconTheme? actionIconTheme ,
    IconButtonThemeData? iconButtonThemeData , 
    String? name 
    , Widget? title
    
    
  }) : super(
          key: key,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation ?? 0,
          actions: [] , 
          actionsIconTheme:const  IconThemeData(), 
          iconTheme: const  IconThemeData(),
          title: Text(name!, style:AppTextStyles.base.kPrimaryColor), 
          centerTitle: true 
          
        );
}
