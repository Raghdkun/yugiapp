import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/data/provider/duelarena_provider.dart';
import 'package:yugiapp/app/utils/appservices.dart';

class DuelArenaController extends GetxController
     {
  final DuelArenaProvider? provider;

  DuelArenaController({this.provider});

  MyServices myService = Get.find();

  int counter = 8000;
  int counter2 = 8000;

  int previousValue = 8000;
  int previousValue2 = 8000;

  bool isHead = true;
  bool isAnimating = false;
  bool isHead2 = true;
  bool isAnimating2 = false;
  bool isHead3 = true;
  bool isAnimating3 = false;
  bool isAnimatingDice = false;
  bool isAnimatingDice2 = false;

  var diceValue = 1;
  var diceValue2 = 1;


  TextEditingController? player1;
  TextEditingController? player2;

  late AnimationController animationController;

  int currentIndex = 0;

  AudioPlayer player = AudioPlayer();
  AudioPlayer fx = AudioPlayer();

  AudioCache audioCache = AudioCache();
  List<String> playlist = [
    'fx/1.mp3',
    'fx/2.mp3',
    'fx/3.mp3',
    'fx/4.mp3',
    'fx/5.mp3',

  ];

  void playNext() async {
    if (currentIndex < playlist.length - 1) {
      // myService.sharedPreferences.setString("audio", "on");
      currentIndex++;
      update();
      print("================================$currentIndex");
      
      await player.play(
        AssetSource(playlist[currentIndex]),
        mode: PlayerMode.mediaPlayer,
        volume: 7

      );
      update();
    } else {
      // await player.setReleaseMode(ReleaseMode.loop);
    }
  }

  playSound() async {
    await player.play(
      AssetSource(playlist[currentIndex], ),
      mode: PlayerMode.mediaPlayer,
      balance: 7
    );

    update();
  }

  addPointsFx()async {
    await fx.play(AssetSource("fx/lpp.mp3"));

  }
  removePointsFx()async {
    await fx.play(AssetSource("fx/lpm.mp3"));

  }

  void playMusic() async {
    if (myService.sharedPreferences.getString("audio") == "on") {
      playSound();
      setupAudioPlayer();
      // await player.setReleaseMode(ReleaseMode.loop);

      myService.sharedPreferences.clear();
      update();

      if (player.state == PlayerState.paused) {
        player.resume();
        update();
      }
      print("================== On ================");

      // update();
    } else if (myService.sharedPreferences.getString("audio") != "on") {
      print("================== Off ================");

      update();
      if (player.state == PlayerState.playing) {
        player.pause();
        myService.sharedPreferences.setString("audio", "on");
        update();
      }
      if (player.state == PlayerState.completed) {
        playSound();
      }
      update();
    } else {
      // player.stop();
      print("================== else ================");
    }
  }

  void setupAudioPlayer() {
    player.onPlayerComplete.listen((event) {
      // currentIndex++ ;
      playNext();
    });
  }

  void increment(int number) {
    previousValue = counter;
    counter += number;
    update();
  }

  void increment2(int number) {
    previousValue2 = counter2;
    counter2 += number;
    update();
  }

  void decrement(int number) {
    previousValue = counter;

    counter -= number;
    update();
  }

  void decrement2(int number) {
    previousValue2 = counter2;

    counter2 -= number;
    update();
  }

  void resetPlayer1() {
    counter = 8000;
    previousValue = 8000;
    player1!.clear();
    update();
  }

  void resetPlayer2() {
    counter2 = 8000;
    previousValue2 = 8000;
    player2!.clear();
    update();
  }

  flipCoin() async {
    if (isAnimating) return;

    isAnimating = true;

    await Future.delayed(const Duration(milliseconds: 1000));

    isHead = !isHead;
    var random = Random();
    isHead = random.nextBool();

    isAnimating = false;

    update();
  }

  flipCoin2() async {
    if (isAnimating2) return;

    isAnimating2 = true;

    await Future.delayed(const Duration(milliseconds: 1000));

    isHead2 = !isHead2;
    var random = Random();
    isHead2 = random.nextBool();

    isAnimating2 = false;

    update();
  }

  flipCoin3() async {
    if (isAnimating3) return;

    isAnimating3 = true;

    await Future.delayed(const Duration(milliseconds: 1000));

    isHead3 = !isHead3;
    var random = Random();
    isHead3 = random.nextBool();

    isAnimating3 = false;

    update();
  }

  rollDice() async {
    if (isAnimatingDice) return;

    isAnimatingDice = true;

    await Future.delayed(Duration(milliseconds: 500));

    // Generate a random dice value between 1 and 6
    var random = Random();
    diceValue = random.nextInt(6) + 1;

    isAnimatingDice = false;
    update();
  }
  rollDice2() async {
    if (isAnimatingDice2) return;

    isAnimatingDice2 = true;

    await Future.delayed(Duration(milliseconds: 500));

    // Generate a random dice value between 1 and 6
    var random = Random();
    diceValue2 = random.nextInt(6) + 1;

    isAnimatingDice2 = false;
    update();
  }

  @override
  void onClose() async {
    await player.pause();
    update();

    // myService.sharedPreferences.clear();
    super.onClose();
  }

  @override
  void dispose() {
    animationController.dispose();
    player.dispose() ; 
    super.dispose();
  }

  @override
  void onInit() {
    player1 = TextEditingController();
    player2 = TextEditingController();
    myService.sharedPreferences.setString("audio", "on");
    // animationController = AnimationController(
    //   duration: const Duration(milliseconds: 200),
    //   // value: 1,
    //   vsync: this,
    // )..repeat(reverse: true);

    // playMusic();

    update();

    // playSoundTrack();

    super.onInit();
  }




}
