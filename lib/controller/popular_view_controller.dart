import 'package:get/get.dart';
import 'package:new_mobile_app/network/api_service.dart';

import '../model/item_popular_model.dart';

class PopularViewController extends GetxController {
  RxList<ItemPopular> itemPopularList = <ItemPopular>[].obs; //0. Khởi tạo 1 mảng rỗng để chứa các đối tượng phim // obs thông báo cho Obx biết về sự thay đổi của itemPopularList khi nó có dữ liệu

  Future<void> getMovieInfo() async {
    Map<String, dynamic> data = await ApiServices().movieInfo(); // 1. Lấy dữ liệu từ API

    List listJsonInforMovie = data['results']; // 2. Lấy mảng Json thông tin các bộ phim tù dữ liệu API

    listJsonInforMovie.forEach((popularJson) => itemPopularList.add(ItemPopular.fromJson(
        popularJson))); //3. Quét qua từng phần tử của mảng Json đó, rồi sau đó chuyển từng phần tử Json thành 1 đối tượng Phim, sau đó add từng đối tượng đó vào mảng itemPopularList rỗng đã khởi tạo từ đầu
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMovieInfo();
  } // Xảy ra rất nhanh chóng, lấy dữ liệu từ API trước để cung cấp cho UI (giao diện) trước khi nó được xây dựng bởi hàm build()
}
