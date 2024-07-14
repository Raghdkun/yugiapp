import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yugiapp/app/data/data_handle/handlingdata.dart';
import 'package:yugiapp/app/modules/cardslist_module/cardslist_controller.dart';
import 'package:yugiapp/app/routes/app_pages.dart';
import 'package:yugiapp/app/utils/constants.dart';

import 'package:yugiapp/app/utils/widgets/app_search.dart';

import '../../themes/app_colors.dart';

class CardsList extends GetWidget<CardsListController> {
  const CardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.formstate,
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => GetBuilder<CardsListController>(
                    builder: (controller) => Dialog(
                          child: Container(
                              height: Get.height / 2,
                              width: Get.width / 1.5,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomSearch(
                                    myText: "",
                                    mycontroller:
                                        controller.searchTextController,
                                    onChanged: (val) {
                                      controller.checkSearch(val);
                                      
                                    },
                                    onCloseSearch: () {
                                      controller.closesearch();
                                    },
                                    // onSearch: () {
                                    //   controller.onSearch();
                                      
                                    // },
                                  ),
                                  MaterialButton(
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 50,
                                    onPressed: () {
                                      controller.onSearch();
                                    },
                                    color: AppColors.black,
                                    child: const Icon(
                                      Icons.search,
                                    ),
                                  ),
                                ],
                              )),
                        )),
              );
            },
            icon: Icon(
              Icons.search,
            )),
            IconButton(onPressed: (){
              // controller.getHiveData(); 
            }, icon: Icon(Icons.add))
      ]),
      body: Container(
        // decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage(AppImageAsset.backgroundgif),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                // padding: const EdgeInsets.all(10),
                child: 
                // controller.hivecards.isEmpty ? 
                GetBuilder<CardsListController>(
                    init: CardsListController(),
                    initState: (controller) {},
                    builder: (controller) => HandlingDataView(
                        loadDataState: controller.loadDataState,
                        widget: controller.onsearch == 0
                            ? CardList()  
                            : SearchedList()))
                    //         GetBuilder<CardsListController>(init: CardsListController(),
                    // initState: (controller) {},builder: (controller) {
                    //   return CardLocalList() ; 
                    // },)
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.defaultDialog(middleText: "${controller.cardsInfo!.name}");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardList extends GetView<CardsListController> {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount:  controller.cards.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        mainAxisExtent: 250,
        childAspectRatio: 1,
      ),
      // padding: EdgeInsets.all(10),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          
            controller.goToCardsDetails(controller.cards[index]); 
            
          
        },
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) =>
              Image.asset(AppImageAsset.emptycard),
          imageUrl: "${EndPoints.cardsImage}/${controller.cards[index].id}.jpg",
          // height: 200,
          // height: 50,
        ),
      ),
    );
  }
}
class CardLocalList extends GetView<CardsListController> {
  const CardLocalList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.hivecards.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        mainAxisExtent: 250,
        childAspectRatio: 1,
      ),
      // padding: EdgeInsets.all(10),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToCardsDetails(controller.hivecards[index]);
        },
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) =>
              Image.asset(AppImageAsset.emptycard),
          imageUrl: "${EndPoints.cardsImage}/${controller.hivecards[index]['id']}.jpg",
          // height: 200,
          // height: 50,
        ),
      ),
    );
  }
}

class SearchedList extends GetView<CardsListController> {
  const SearchedList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.searchCards.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        mainAxisExtent: 250,
        childAspectRatio: 1,
      ),
      // padding: EdgeInsets.all(10),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToCardsDetails(controller.searchCards[index]);
        },
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) =>
              Image.asset(AppImageAsset.emptycard),
          imageUrl:
              "${EndPoints.cardsImage}/${controller.searchCards[index].id}.jpg",
          // height: 200,
          // height: 50,
        ),
      ),
    );
  }
}
