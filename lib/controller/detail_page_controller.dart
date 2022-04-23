import 'package:get/get.dart';
import 'package:new_mobile_app/model/item_cast.dart';
import 'package:new_mobile_app/network/api_service.dart';

import '../model/item_popular_model.dart';

class DetailPageController extends GetxController {
  Future<List<ItemCast>> getCastInfo(String id) async {
    Map<String, dynamic> data = await ApiServices().castInfo(id);

    List listJsonInforCast = data['cast'];

    return listJsonInforCast.map((castJson) {
      print(ItemCast.fromJson(castJson).name);
      return ItemCast.fromJson(castJson);
    }).toList();
  }



}
