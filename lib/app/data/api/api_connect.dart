
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:yugiapp/app/utils/constants.dart';

import 'package:yugiapp/app/utils/widgets/checkinternet.dart';

class ApiConnect {
 Future<Either<LoadDataState, Map>> postData(String linkurl, Map data) async {
   
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
          // print(response.statusCode) ; 

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          // print(responsebody) ; 
          return Right(responsebody);
        } else {
          return const Left(LoadDataState.error);
        }
      } else {
        return const Left(LoadDataState.offline);
      }
     
  }
}
// class ApiGetConnect {
//  Future<Either<LoadDataState, Map>> postData(String linkurl, ) async {
   
//       if (await checkInternet()) {
//         var response = await http.get(Uri.parse(linkurl), );
//           // print(response.statusCode) ; 

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           // print(responsebody) ; 
//           return Right(responsebody);
//         } else {
//           return const Left(LoadDataState.error);
//         }
//       } else {
//         return const Left(LoadDataState.offline);
//       }
     
//   }
// }
