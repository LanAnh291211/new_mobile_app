import 'package:get/get.dart';
import 'package:new_mobile_app/network/api_url.dart';

class ApiServices extends GetConnect {

static final ApiServices _apiServices = ApiServices._internal();

  factory ApiServices() {
    return _apiServices;
  }

  ApiServices._internal();

    Future movieInfo() async {
    Response response= await get(ApiURL.movieforUrl).catchError((e){
      print("Lỗi là " + e.toString());


    });
    return response.body;
  }
    Future castInfo(String id ) async {
    Response response= await get(ApiURL.castUrl(id)).catchError((e){
      print("Lỗi là " + e.toString());


    });
    return response.body;
  }
}