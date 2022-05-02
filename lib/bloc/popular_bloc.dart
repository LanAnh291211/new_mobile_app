import 'package:new_mobile_app/model/item_popular_model.dart';
import 'package:new_mobile_app/respository/popularview_repositoty.dart';
import 'package:rxdart/rxdart.dart';

class PopularBloc {
  final _popularFetcher = PublishSubject<List<ItemPopular>>(); // Tạo Stream

  
  fetchItemPopularList() async {
    List<ItemPopular> itemPopularList = await PopularViewRepository.getMovieInfo(); // Lấy dữ liệu từ API
    _popularFetcher.sink.add(itemPopularList);   // Nhúng dữ liệu vào stream
  } 


  Stream<List<ItemPopular>> get allItemPopular => _popularFetcher.stream; // Cho ra stream

  dispose() {
    _popularFetcher.close();
  }
}
