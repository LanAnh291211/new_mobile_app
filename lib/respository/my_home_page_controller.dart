import 'package:new_mobile_app/network/api_service.dart';

import '../model/item_popular_model.dart';

class PopularViewRepository  { //Đây là 1 kho chứa các hàm lấy dữ liệu từ API
  static Future<List<ItemPopular>> getMovieInfo() async { // Đây là 1 hàm trong kho này
    Map<String, dynamic> data = await ApiServices().movieInfo(); // doi anh chut

    List listJsonInforMovie = data['results'];

    return listJsonInforMovie.map((e) => ItemPopular.fromJson(e)).toList();
  } // Repository => KHo
}
