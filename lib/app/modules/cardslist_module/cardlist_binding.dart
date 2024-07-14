import 'package:get/get.dart';

import 'package:yugiapp/app/data/provider/cardslist_provider.dart';
import 'package:yugiapp/app/modules/cardslist_module/cardslist_controller.dart';

class CardsListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      CardsListController(
        provider: CardsListProvider(Get.find())
      ),
    );
  }
}
