import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';

class NewAppBar extends StatelessWidget {
  final String name;
  final void Function()? botton1;
  final void Function()? botton2;
  final Widget? icon1;
  final Widget? icon2;

  const NewAppBar(
      {super.key,
      required this.name,
      this.botton1,
      this.botton2,
      this.icon1,
      this.icon2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: botton1,
              icon: icon1 ??
                  Container()),
          Text(
            name,
            style: AppTextStyles.base.s18.w700,
          ),
          IconButton(
              onPressed: botton2,
              icon: icon2 ??
                  Container())
        ],
      ),
    );
  }
}
// Get.back();
