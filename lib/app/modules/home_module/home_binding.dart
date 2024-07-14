import 'package:get/get.dart';

import 'package:yugiapp/app/data/provider/home_provider.dart';
import 'package:yugiapp/app/modules/home_module/home_controller.dart';

class HomeBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.put(
       HomeController(
provider: HomeProvider(Get.find())        
        
      ),
    );
  }
}
