import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yugiapp/app/modules/home_module/home_controller.dart';
import 'package:yugiapp/app/routes/app_pages.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
            ))
      ]),
      drawer: Drawer(),
      body: Container(
        // decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage(AppImageAsset.backgroundgif),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
        child: ListView(
          children: [
            Container(
              height: Get.height / 7,
              width: Get.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.duelarena);
                },
                child: Card(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Duel Calculator",
                        style: AppTextStyles.base.s18.w700,
                      )),
                ),
              ),
            ),
            Container(
              height: Get.height / 7,
              width: Get.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.cardslist);
                },
                child: Card(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Cards List",
                        style: AppTextStyles.base.s18.w700,
                      )),
                ),
              ),
            ),
            Container(
              height: Get.height / 7,
              width: Get.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Deck Builder",
                        style: AppTextStyles.base.s18.w700,
                      )),
                ),
              ),
            ),
            Container(
              height: Get.height / 7,
              width: Get.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Decks",
                        style: AppTextStyles.base.s18.w700,
                      )),
                ),
              ),
            ),
            Container(
              height: Get.height / 7,
              width: Get.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.generalGuidePage); 
                },
                child: Card(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Duel Guide",
                        style: AppTextStyles.base.s18.w700,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.defaultDialog(middleText: "${controller.cardsInfo!.name}");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
