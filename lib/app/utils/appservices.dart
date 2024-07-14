import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart' ;
import 'package:hive/hive.dart';


class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    

    
//  String link = 'https://dynamic-link-domain/ke2Qa';


//     FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
//   Navigator.pushNamed(context as BuildContext, dynamicLinkData.link.path);
// }).onError((error) {
//   // Handle errors
// });


    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
