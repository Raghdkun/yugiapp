import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/data/data_handle/handling_function.dart';
import 'package:yugiapp/app/data/model/cardsinfo_model.dart';
import 'package:yugiapp/app/data/provider/carddetails_provider.dart';
import 'package:yugiapp/app/modules/carddetails_module/carddetails_page.dart';
import 'package:yugiapp/app/routes/app_pages.dart';
import 'package:yugiapp/app/utils/constants.dart';

class CardDetailsController extends GetxController {
  CardDetailsController({this.provider});

  final CardDetailsProvider? provider;

  CardDetailsProvider cardDetailsProvider = CardDetailsProvider(Get.find());
  // PageController pageController = PageController();
  // ScrollController scrollController = ScrollController();
  bool showSecondPage = false;

  late CardsModel datamodel;
  late List hivedata ; 


 

  late TextEditingController searchedname ; 

  late LoadDataState loadDataState ;

  CardDetailsProvider cardProvider = CardDetailsProvider(Get.find()) ; 

 
  List<CardsModel> cards = [ ] ; 
  List<CardsModel> realated = [ ] ; 


  // getCards() async {
  //   loadDataState = LoadDataState.loading;
  //   update();

  //   var response = await cardProvider.getData();
  //   loadDataState = handlingData(response);
  //   if (LoadDataState.initialize == loadDataState ) {
  //     List listdata = response['data'];
  //     cards.addAll(listdata.map((e) => CardsModel.fromJson(e)));
     
      
  //     update(); 

      
  //     print(listdata);
  //   }else {
  //     loadDataState = LoadDataState.error ; 
  //   }
  //   update(); 
  // }

   List<CardsModel> searchedCards(String name ,  List<CardsModel> cards) {
    return cards
        .where((card) =>
            card.name!.toLowerCase().contains( name.toLowerCase() ))
        .toList();
  }


  getRealtedCards(String name){ 
    List<CardsModel> searchResults = searchedCards(name , cards);
    realated.clear(); 
    realated.addAll(searchResults); 
    update(); 
    return searchResults ; 
    


  }
goToCardsDetails(
    CardsModel cardsModel,
  ) {
    Get.toNamed(AppRoutes.seccarddetails, 
    arguments: {
      "datamodel": datamodel,
      "searchedname" : searchedname , 
      
    }
    );
    print("hhhhhhhhhhhhhh"); 
  }

  
  @override
  void dispose() {
    //  pageController.dispose();
    // scrollController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    datamodel = Get.arguments['datamodel'];
    searchedname = Get.arguments["searchedname"] ; 
    // hivedata = Get.arguments['hivelist'] ; 
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels >=
    //       scrollController.position.maxScrollExtent) {
    //         showSecondPage = true ; 
    //         update(); 
    //       }
    // });
    // getCards(); 
    super.onInit();
  }
}
