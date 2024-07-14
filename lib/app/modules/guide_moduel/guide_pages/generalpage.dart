import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/modules/guide_moduel/generalpage_controller.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';
import 'package:yugiapp/app/utils/widgets/app_divider/app_divider.dart';

class GeneralGuidePage extends GetWidget<GeneralRuleBookPageController> {
  const GeneralGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guide'),
      ),
      drawer: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Drawer(
            child: GetBuilder<GeneralRuleBookPageController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(children: [
              ...List.generate(
                10,
                (index) => InkWell(
                  onTap: () {
                    controller.pageController.animateToPage(5,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.bounceInOut);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Guide Data",
                        style: AppTextStyles.base.s18.w600,
                      ),
                      const AppDivider(
                        color: Colors.black45,
                        height: 3,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: PageView.builder(
          itemCount: 10,
          controller: controller.pageController,
          itemBuilder: (context, index) => Container(
            child: InkWell(
                onTap: () => controller.getIndex(index),
                child: Text(
                  "next",
                  style: AppTextStyles.base.s40.w800,
                )),
          ),
        ),
      ),
    );
  }
}
