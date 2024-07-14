import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/modules/duelarena_module/duelarena_controller.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';
import 'package:yugiapp/app/utils/widgets/app_button/app_button.dart';
import 'package:yugiapp/app/utils/widgets/app_text_field/geteraltextfield.dart';

class PlayerOneCounter extends GetView<DuelArenaController> {
  const PlayerOneCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GeneralTextFiels(
                                textInputType: TextInputType.number,
                                controller: controller.player1!,
                                text: "${controller.counter}"),
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
                                    controller.increment(
                                        int.parse(controller.player1!.text));
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
                                    controller.decrement(
                                        int.parse(controller.player1!.text));
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
              height: Get.height /4.2,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  border: Border.all(
                      width: 3, color: Colors.white.withOpacity(0.8)),
                  borderRadius: BorderRadiusDirectional.circular(15)),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PLAYER ONE",
                    style: AppTextStyles.base.s32.w600.whiteColor,
                  ),
                  TweenAnimationBuilder(
                    tween: IntTween(
                        begin: controller.previousValue,
                        end: controller.counter),
                    duration: Duration(milliseconds: 1500),
                    builder: (context, value, child) => Text(
                      value.toString(),
                      style: AppTextStyles.base.s60.w600.whiteColor,
                    ),
                  ),
                  controller.counter == 0
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
          SizedBox(
            height: 10,
          ),
          Container(
            width: 130,
            height: 50,
            child: AppButton(
              onPressed: () {
                controller.resetPlayer1();
              },
              text: "Reset",
            ),
          ),
        ],
      ),
    );
  }
}
