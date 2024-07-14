import 'package:yugiapp/app/data/api/api_connect.dart';
import 'package:yugiapp/app/utils/constants.dart';

class CardDetailsProvider { 
  ApiConnect apiConnect;

  CardDetailsProvider(this.apiConnect);

  getData() async {
    var response = await apiConnect.postData(EndPoints.cardsinfo, {});
    return response.fold((l) => l, (r) => r);
  }
  
}