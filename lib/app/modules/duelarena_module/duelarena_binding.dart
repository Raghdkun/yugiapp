import 'package:get/get.dart';
import 'package:yugiapp/app/data/provider/duelarena_provider.dart';
import 'package:yugiapp/app/modules/duelarena_module/duelarena_controller.dart';

class DuelArenaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DuelArenaController(
      provider: DuelArenaProvider()
    )); 
  } 

}