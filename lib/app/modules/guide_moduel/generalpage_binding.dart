import 'package:get/get.dart';
import 'package:yugiapp/app/modules/guide_moduel/generalpage_controller.dart';

class GeneralGuidePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GeneralRuleBookPageController()); 
    
  }

}