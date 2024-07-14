import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yugiapp/app/data/model/cardsinfo_model.dart';
import 'package:yugiapp/app/modules/carddetails_module/carddetails_controller.dart';
import 'package:yugiapp/app/routes/app_pages.dart';
import 'package:yugiapp/app/themes/app_colors.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';
import 'package:yugiapp/app/utils/constants.dart';
import 'package:yugiapp/app/utils/widgets/app_bar/custom_app_bar.dart';

class CardDetails extends GetWidget<CardDetailsController> {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          name: "details",
          backgroundColor: Colors.transparent,
        ),
        body:FirstPage());
  }
}

//  PageView(
//           controller: controller.pageController,
//           scrollDirection: Axis.vertical,
//           allowImplicitScrolling: true,
//           dragStartBehavior: DragStartBehavior.down,
//           children: [FirstPage(), SecPage()],
//         )

class FirstPage extends GetView<CardDetailsController> {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CardDetailsController());
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(AppImageAsset.backgroundgif),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      padding: const EdgeInsets.all(10),
      child: ListView(children: [
        controller.datamodel.level != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    controller.datamodel.level!,
                    (index) => CircleAvatar(
                      backgroundColor: controller.datamodel.frameType == "xyz"
                          ? Colors.black
                          : const Color.fromARGB(255, 163, 22, 12),
                      radius: 14,
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        const SizedBox(
          height: 10,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) =>
                  Image.asset(AppImageAsset.emptycard),
              imageUrl:
                  "${EndPoints.cardsImages}/cards_cropped/${controller.datamodel.id}.jpg",
              height: Get.height / 2.9,
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.colorDivider),
          child: Center(
              child: Text(
            "${controller.datamodel.name}",
            textAlign: TextAlign.center,
            style: AppTextStyles.base.s16.w900,
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: Get.height / 4.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.colorDivider),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                controller.datamodel.attribute != null
                    ? Text(
                        "${controller.datamodel.attribute}",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.base.s20.w700,
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${controller.datamodel.frameType} card",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.base.s16.w700,
                    ),
                    Text(
                      "/${controller.datamodel.race}",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.base.s16.w700,
                    ),
                  ],
                ),
                Text(
                  "${controller.datamodel.desc}",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.base.s16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        controller.datamodel.attribute != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "ATK ${controller.datamodel.atk}",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.base.s20.w800,
                  ),
                  Text(
                    "DEF ${controller.datamodel.def}",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.base.s20.w800,
                  )
                ],
              )
            : Container(),
        // IconButton(
        //     onPressed: () {
        //       controller.pageController.animateToPage(
        //         1,
        //         duration: Duration(milliseconds: 600),
        //         curve: Curves.easeInOut,
        //       );
        //       controller.getRealtedCards(controller.datamodel.name!
        //           .replaceFirst(controller.datamodel.name!.substring(0, 5), ''));
        //     },
        //     icon: Icon(CupertinoIcons.arrow_down))
      ]),
    );
  }
}

class SecPage extends GetView<CardDetailsController> {
  const SecPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<CardDetailsController>(
        builder: (controller) => ListView(
         
          children: [
            // CardsnewList(),
          ],
        ),
      ),
    );
  }
}

class CardsnewList extends GetView<CardDetailsController> {
  const CardsnewList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.realated.length,
       physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,


      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        mainAxisExtent: 250,
        childAspectRatio: 1,
      ),
      // padding: EdgeInsets.all(10),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToCardsDetails(controller.realated[index]);
        },
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) =>
              Image.asset(AppImageAsset.emptycard),
          imageUrl:
              "${EndPoints.cardsImage}/${controller.realated[index].id}.jpg",
          // height: 200,
          // height: 50,
        ),
      ),
    );
  }
}
