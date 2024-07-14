import 'package:get/get.dart';
import 'package:yugiapp/app/data/provider/carddetails_provider.dart';
import 'package:yugiapp/app/modules/carddetails_module/carddetails_controller.dart';

class CardDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      CardDetailsController(
        provider: CardDetailsProvider(Get.find()),
      ),
    );
  }
}
