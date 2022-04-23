import 'package:get/get.dart';
import 'package:new_mobile_app/network/api_service.dart';

import '../model/item_popular_model.dart';

class MyHomePageController extends GetxController {
  Future<List<ItemPopular>> getMovieInfo() async {
    Map<String, dynamic> data = await ApiServices().movieInfo();

    List listJsonInforMovie = data['results'];
    return listJsonInforMovie.map((e) => ItemPopular.fromJson(e)).toList();
  }
}
