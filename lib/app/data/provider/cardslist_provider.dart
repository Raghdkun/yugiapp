import 'package:yugiapp/app/data/api/api_connect.dart';
import 'package:yugiapp/app/data/database/database_helper.dart';

import 'package:yugiapp/app/utils/constants.dart';

class CardsListProvider {
  ApiConnect apiConnect;
  DatabaseHelper? databaseHelper;
  // Getsearch? getsearch ;

  CardsListProvider(this.apiConnect);

  getData() async {
    var response = await apiConnect.postData(EndPoints.cardsinfo, {});
    return response.fold((l) => l, (r) => r);
  }

  // insertLocaldata(
  //   int id,
  //   String name,
  //   String type,
  //   String frameType,
  //   String desc,
  //   int atk,
  //   int def,
  //   int level,
  //   String race,
  //   String attribute,
  // ) async {
  //   int response = await databaseHelper!.insertCard(
  //       "INSERT INTO 'cards' ('id') VALUE ('$id') , ('name') VALUE ('$name') ,('type') VALUE ('$type') ,('frameType') VALUE ('$frameType') ,('desc') VALUE ('$desc') ,('atk') VALUE ('$atk') ,('def') VALUE ('$def') ,('level') VALUE ('$level') ,('race') VALUE ('$race') ,('attribute') VALUE ('$attribute') , ");
  //       return response ;
  // }
  
  // getarchtype(String name) async {
  //   var response = await apiConnect.postData("${EndPoints.archtypecards}$name", {

  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
}
