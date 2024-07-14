import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yugiapp/app/data/data_handle/handling_function.dart';
import 'package:yugiapp/app/data/database/database_helper.dart';
import 'package:yugiapp/app/data/model/cardsinfo_model.dart';
import 'package:yugiapp/app/data/provider/cardslist_provider.dart';
import 'package:yugiapp/app/routes/app_pages.dart';
import 'package:yugiapp/app/utils/appservices.dart';
import 'package:yugiapp/app/utils/constants.dart';
import 'package:yugiapp/app/utils/hiveadapter.dart';

class CardsListController extends GetxController {
  CardsListController({this.provider});
  final CardsListProvider? provider;
  List<CardsModel> cards = [];
  List<CardImages> cardImges = [];

  List hivecards = [];

  List<CardsModel> searchCards = [];

  List<CardsModel> localcards = [];

  DatabaseHelper databaseHelper = DatabaseHelper();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  MyServices? myServices;

  DragSelectGridViewController dragListController =
      DragSelectGridViewController();

  CardsModel? cardsModel;

  // bool? isSearch ;
late String save ; 
  int onsearch = 0;

  late LoadDataState loadDataState;

  CardsListProvider cardsListProvider = CardsListProvider(Get.find());

  TextEditingController? searchTextController;

  getCards() async {
    loadDataState = LoadDataState.loading;
    // myServices!.sharedPreferences.setString("save", "1");
    update();
    final box = await Hive.openBox("cardsBox");

    
      var response = await cardsListProvider.getData();
      loadDataState = handlingData(response);
      if (LoadDataState.initialize == loadDataState) {
        List listdata = response['data'];
        List listdatahive = response['data'];

        cards.addAll(listdata.map((e) => CardsModel.fromJson(e)));
        
        var box = await Hive.openBox("cardsBox");
        box.clear();
        box.addAll(listdatahive);
        hivecards.addAll(listdatahive);
        update();
        print(listdata);

        cardImges.addAll(listdata.map((e) => CardImages.fromJson(e)));
        print(cardImges); 
   
   



      

      // List<SavedCardsModel>? newdata = listdata.cast<SavedCardsModel>() ;

      print("hive ============= $hivecards");

      update();
      // List locallist = response['data'] ;
      // int res =  databaseHelper.insertCard();
      // print("====== $res");
    } else {
      loadDataState = LoadDataState.error;
    }
    update();
  }

  insertCardsLocalList() async {}

  getLocalCards() async {
    loadDataState = LoadDataState.loading;
    update();
    var response = await databaseHelper!.getAllCards();
    print("local data stored =========== $response");

    List listdata = response;
    localcards.addAll(listdata.map((e) => CardsModel.fromJson(e)));
  }

  List<CardsModel> searchedCards(String searchTerm, List<CardsModel> cards) {
    return cards
        .where((card) =>
            card.name!.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }

  searchAndUpdate(String searchTerm) {
    List<CardsModel> searchResults = searchedCards(searchTerm, cards);
    searchCards.clear();
    searchCards.addAll(searchResults);
    onsearch = 1;
    update();
    return searchResults;
  }

  closesearch() {
    onsearch = 0;

    if (searchTextController!.text.isNotEmpty) {
      searchTextController!.clear();
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      onsearch = 0;
    }
    update();
  }

  onSearch() {
    if (searchTextController!.text.isEmpty) {
      Get.defaultDialog(
          middleText: "You Can Use Searchbar if the Form Is Empty!",
          actions: [
            MaterialButton(
              onPressed: () {
                Get.close(1);
              },
              child: Text("OK"),
            )
          ]);
    } else {
      // searchdata();
      searchAndUpdate(searchTextController!.text);
      Get.back();
      update();
    }
  }

  goToCardsDetails(
    CardsModel? cardsModel,
  ) {
    Get.toNamed(AppRoutes.carddetails, arguments: {
      "datamodel": cardsModel,
      "hivelist": hivecards,
      "searchedname": searchTextController,
    });
  }

  goToCardsDetailsHive(List hivecards) {
    Get.toNamed(AppRoutes.carddetails, arguments: {
      // "datamodel": cardsModel,
      "hivelist": hivecards,

      "searchedname": searchTextController,
    });
  }

  // saveData(List<CardsModel> data) async {
  //   var box = await Hive.openBox("cardsBox");
  //   await box.clear();

  //     box.add(data);

  //   // var data = box.values.toList().cast<SavedCardsModel>();
  //   // print("new daaaata ====== $data");
  //   // return data ;
  // }

  // Future<List<SavedCardsModel>> getHiveData() async {
  //   final box = await Hive.openBox("cardsBox");
  // Future.delayed(const Duration(seconds: 3));

  //  hivecards = cards.cast<SavedCardsModel>() ;
  //  hivecards.addAll(box.values.toList().cast<CardsModel>() as Iterable<SavedCardsModel>)  ;

  // hivecards.add(box.addAll(values))
  // print("new daaaata ====== $hivecards");
  // return hivecards ;

  // }

  // search(searchName) {
  //   searchCards = cards.where((search) {
  //     var searchTitile = search.name!.toLowerCase().toString();
  //     // var searchType = search['type'].toLowerCase().toString();
  //     // var searchArchetype = search['archetype'].toLowerCase().toString();

  //     searchName = searchName.toLowerCase().toString();
  //     return searchTitile.contains(searchName);
  //   }).toList();

  //   update();
  // }

  @override
  void onInit() {
    if(hivecards.isEmpty){
      getCards();

    }
    
    // saveData(cards.cast<SavedCardsModel>());
    // getHiveData();

    // dragListController.addListener(scheduleRebuild);

    // getLocalCards();
    // searchTextController = TextEditingController();
    searchTextController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    // dragListController.dispose();

    super.dispose();
  }

  void scheduleRebuild() {}
}
