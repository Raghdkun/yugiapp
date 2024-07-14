import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/data/data_handle/handling_function.dart';
import 'package:yugiapp/app/data/model/cardsinfo_model.dart';
import 'package:yugiapp/app/data/provider/home_provider.dart';
import 'package:yugiapp/app/routes/app_pages.dart';
import 'package:yugiapp/app/utils/constants.dart';

class HomeController extends GetxController {
  HomeController({this.provider});
  final HomeProvider? provider;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
