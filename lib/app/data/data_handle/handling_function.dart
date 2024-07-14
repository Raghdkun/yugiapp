import 'package:yugiapp/app/utils/constants.dart';

handlingData(response) {
  if (response is LoadDataState){
    return response ;
  }else{
    return LoadDataState.initialize ;
  }
}
