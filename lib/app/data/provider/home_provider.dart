import 'package:yugiapp/app/data/api/api_connect.dart';

import 'package:yugiapp/app/utils/constants.dart';

class HomeProvider {
  ApiConnect apiConnect;
  // Getsearch? getsearch ; 

  HomeProvider(this.apiConnect);

  getData() async {
    var response = await apiConnect.postData(EndPoints.cardsinfo, {});
    return response.fold((l) => l, (r) => r);
  }
  getarchtype(String name) async {
    var response = await apiConnect.postData("${EndPoints.archtypecards}$name", {
      
    });
    return response.fold((l) => l, (r) => r);
  }

}
