import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GeneralRuleBookPageController extends GetxController {

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }


  int pIndex = 0 ; 


  PageController pageController = PageController() ; 

  int getIndex(pIndex){
    pIndex++ ; 
    update(); 
    return pIndex ; 

  }
  

}