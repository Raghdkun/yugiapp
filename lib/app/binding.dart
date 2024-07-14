import 'package:get/get.dart';
import 'package:yugiapp/app/data/api/api_connect.dart';

class IntialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiConnect()) ;


  }

}