import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/modules/duelarena_module/duelarena_controller.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';
import 'package:yugiapp/app/utils/widgets/app_button/app_button.dart';
import 'package:yugiapp/app/utils/widgets/app_text_field/geteraltextfield.dart';

class PlayerTwoCounter extends GetView<DuelArenaController> {
  const PlayerTwoCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130,
          height: 50,
          child: AppButton(
            onPressed: () {
              controller.resetPlayer2();
            },
            text: "Reset",
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    alignment: Alignment.center,
                    backgroundColor: Colors.white,
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GeneralTextFiels(
                                  textInputType: TextInputType.number,
                                  controller: controller.player2!,
                                  text: "${controller.counter2}"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 50,
                                  child: AppButton(
                                    onPressed: () {
                                      controller.increment2(
                                          int.parse(controller.player2!.text));
                                      Get.back();
                                      controller.addPointsFx();
                                    },
                                    text: "+",
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 50,
                                  child: AppButton(
                                    onPressed: () {
                                      controller.decrement2(
                                          int.parse(controller.player2!.text));
                                      Get.back();
                                      controller.removePointsFx();
                                    },
                                    text: "-",
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                );
              },
              child: Container(
                // alignment: Alignment.center,
                height: Get.height / 4.2,

                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    border: Border.all(
                        width: 3, color: Colors.white.withOpacity(0.8)),
                    borderRadius: BorderRadiusDirectional.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PLAYER TWO",
                      style: AppTextStyles.base.s32.w600.whiteColor,
                    ),
                    TweenAnimationBuilder(
                      tween: IntTween(
                          begin: controller.previousValue2,
                          end: controller.counter2),
                      duration: Duration(milliseconds: 1500),
                      builder: (context, value, child) => Text(
                        value.toString(),
                        style: AppTextStyles.base.s60.w600.whiteColor,
                      ),
                    ),
                    controller.counter2 == 0
                        ? Text(
                            "YOU LOST",
                            style: AppTextStyles.base.s18.w600.whiteColor,
                            textAlign: TextAlign.center,
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
