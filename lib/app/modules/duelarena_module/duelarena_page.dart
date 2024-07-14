import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/modules/duelarena_module/duelarena_controller.dart';
import 'package:yugiapp/app/themes/app_text_theme.dart';
import 'package:yugiapp/app/utils/constants.dart';
import 'package:yugiapp/app/utils/widgets/app_bar/newappbar.dart';
import 'package:yugiapp/app/utils/widgets/app_button/app_button.dart';
import 'package:yugiapp/app/utils/widgets/players_counters/playerone_counter.dart';
import 'package:yugiapp/app/utils/widgets/players_counters/playertwo_counter.dart';

class DuelArena extends GetWidget<DuelArenaController> {
  const DuelArena({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.kPrimaryColor,
      //   elevation: 0,
      // ),
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(AppImageAsset.backgroundgif),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<DuelArenaController>(
          init: DuelArenaController(),
          initState: (controller) {},
          builder: (controller) {
            return ListView(
              clipBehavior: Clip.none,
              children: [
                NewAppBar(
                  name: "Let's Duel",
                  botton1: () {
                    Get.back();
                  },
                  botton2: () {
                    // controller.myService.sharedPreferences.setString("audio", "on");
                    controller.playMusic();
                  },
                  icon1: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  icon2: controller.player.state == PlayerState.playing
                      ? const Icon(
                          Icons.music_note,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.music_off,
                          color: Colors.white,
                        ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerOneCounter(),
                    Container(
                      height: MediaQuery.sizeOf(context).height / 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 140,
                              height: 50,
                              child: AppButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                        child: GetBuilder<DuelArenaController>(
                                      builder: (controller) => Container(
                                        height: 300,
                                        width: 300,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                AnimatedSwitcher(
                                                  duration: const Duration(
                                                      milliseconds: 1500),
                                                  transitionBuilder:
                                                      (child, animation) =>
                                                          RotationTransition(
                                                    turns: animation,
                                                    child: child,
                                                  ),
                                                  switchInCurve:
                                                      Curves.easeInOut,
                                                  switchOutCurve:
                                                      Curves.easeInOut,
                                                  child: controller.isHead
                                                      ? Image.asset(
                                                          AppImageAsset
                                                              .headcoin,
                                                          height: 60,
                                                          key: UniqueKey())
                                                      : Image.asset(
                                                          AppImageAsset
                                                              .tailcoin,
                                                          height: 60,
                                                          key: UniqueKey()),
                                                ),
                                                AnimatedSwitcher(
                                                  duration: const Duration(
                                                      milliseconds: 1500),
                                                  transitionBuilder:
                                                      (child, animation) =>
                                                          RotationTransition(
                                                    turns: animation,
                                                    child: child,
                                                  ),
                                                  switchInCurve:
                                                      Curves.easeInOut,
                                                  switchOutCurve:
                                                      Curves.easeInOut,
                                                  child: controller.isHead2
                                                      ? Image.asset(
                                                          AppImageAsset
                                                              .headcoin,
                                                          height: 60,
                                                          key: UniqueKey())
                                                      : Image.asset(
                                                          AppImageAsset
                                                              .tailcoin,
                                                          height: 60,
                                                          key: UniqueKey()),
                                                ),
                                                AnimatedSwitcher(
                                                  duration: const Duration(
                                                      milliseconds: 1500),
                                                  transitionBuilder:
                                                      (child, animation) =>
                                                          RotationTransition(
                                                    turns: animation,
                                                    child: child,
                                                  ),
                                                  switchInCurve:
                                                      Curves.easeInOut,
                                                  switchOutCurve:
                                                      Curves.easeInOut,
                                                  child: controller.isHead3
                                                      ? Image.asset(
                                                          AppImageAsset
                                                              .headcoin,
                                                          height: 60,
                                                          key: UniqueKey())
                                                      : Image.asset(
                                                          AppImageAsset
                                                              .tailcoin,
                                                          height: 60,
                                                          key: UniqueKey()),
                                                ),
                                              ],
                                            ),
                                            controller.isHead == false
                                                ? Text(
                                                    "You Win",
                                                    style: AppTextStyles
                                                        .base.s20.w600,
                                                  )
                                                : Text(
                                                    "You Lose",
                                                    style: AppTextStyles
                                                        .base.s20.w600,
                                                  ),
                                            Container(
                                              width: 120,
                                              height: 50,
                                              child: AppButton(
                                                onPressed: () {
                                                  controller.flipCoin();
                                                  controller.flipCoin2();
                                                  controller.flipCoin3();
                                                },
                                                text: "Go",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                  );
                                },
                                text: "Coins",
                              )),
                          Container(
                              width: 140,
                              height: 50,
                              child: AppButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                        child: GetBuilder<DuelArenaController>(
                                      builder: (controller) => Container(
                                        width: 300,
                                        height: 300,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  AnimatedSwitcher(
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      transitionBuilder: (child,
                                                              animation) =>
                                                          FadeTransition(
                                                            opacity: animation,
                                                            child: child,
                                                          ),
                                                      child: Image.asset(
                                                        'assets/images/dice${controller.diceValue}.png',
                                                        height: 100,
                                                        key: ValueKey(controller
                                                            .diceValue),
                                                      )),
                                                  AnimatedSwitcher(
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      transitionBuilder: (child,
                                                              animation) =>
                                                          FadeTransition(
                                                            opacity: animation,
                                                            child: child,
                                                          ),
                                                      child: Image.asset(
                                                        'assets/images/dice${controller.diceValue2}.png',
                                                        height: 100,
                                                        key: ValueKey(controller
                                                            .diceValue2),
                                                      )),
                                                ],
                                              ),
                                              Container(
                                                  width: 120,
                                                  height: 50,
                                                  child: AppButton(
                                                    onPressed: () {
                                                      controller.rollDice();
                                                      controller.rollDice2();
                                                    },
                                                    text: "Roll",
                                                  )),
                                            ]),
                                      ),
                                    )),
                                  );
                                },
                                text: "Dices",
                              )),
                        ],
                      ),
                    ),
                    PlayerTwoCounter()
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

