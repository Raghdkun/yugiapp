
import 'package:get/get.dart';
import 'package:yugiapp/app/modules/carddetails_module/carddetails_binding.dart';
import 'package:yugiapp/app/modules/carddetails_module/carddetails_page.dart';
import 'package:yugiapp/app/modules/carddetails_module/seccarddetails_page.dart';
import 'package:yugiapp/app/modules/cardslist_module/cardlist_binding.dart';
import 'package:yugiapp/app/modules/cardslist_module/cardslist_page.dart';
import 'package:yugiapp/app/modules/duelarena_module/duelarena_binding.dart';
import 'package:yugiapp/app/modules/duelarena_module/duelarena_page.dart';
import 'package:yugiapp/app/modules/guide_moduel/generalpage_binding.dart';
import 'package:yugiapp/app/modules/guide_moduel/guide_pages/generalpage.dart';
import 'package:yugiapp/app/modules/home_module/home_binding.dart';
import 'package:yugiapp/app/modules/home_module/home_page.dart';
import 'package:yugiapp/app/modules/splash_module/splash_page.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.leftToRightWithFade, 
      transitionDuration: const Duration(milliseconds: 800)
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      transition: Transition.leftToRightWithFade, 
      transitionDuration: const Duration(milliseconds: 800)
    ),
    GetPage(
      name: AppRoutes.cardslist,
      page: () => const CardsList(),
      binding: CardsListBinding(),
      transition: Transition.leftToRightWithFade, 
      transitionDuration: const Duration(milliseconds: 800)
    ),
    GetPage(
      name: AppRoutes.carddetails,
      page: () => const CardDetails(),
      // binding: CardDetailsBinding(),
      transition: Transition.leftToRightWithFade, 
      transitionDuration: const Duration(milliseconds: 800)
    ),
    GetPage(
      name: AppRoutes.seccarddetails,
      page: () => const SecCardDetails(),
      // binding: CardDetailsBinding(),
      transition: Transition.leftToRightWithFade, 
      transitionDuration: const Duration(milliseconds: 800)
    ),
    GetPage(
      name: AppRoutes.duelarena,
      page: () => const DuelArena(),
      binding: DuelArenaBinding(), 
      transition: Transition.leftToRightWithFade, 
      transitionDuration: const Duration(milliseconds: 800)
    ),
     GetPage(
      name: AppRoutes.generalGuidePage,
      page: () => const GeneralGuidePage(),
      binding: GeneralGuidePageBinding(), 
      transition: Transition.leftToRightWithFade, 
      transitionDuration: const Duration(milliseconds: 800)
    ),
  ];
}
