import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_mobile_app/respository/popularview_repositoty.dart';
import 'package:provider/provider.dart';

import '../bloc/popular_bloc.dart';
import '../model/item_popular_model.dart';
import 'detail_screen.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  final _popularBloc = PopularBloc();

  @override
  void initState() {     // Tương tự onInit của Getx là gọi hàm lấy dữ liệu từ API trước khi UI được xây dựng trong hàm build()
    // TODO: implement initState
    super.initState();
    _popularBloc.fetchItemPopularList();  // Lấy dữ liệu từ API
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ItemPopular>>(
        stream: _popularBloc.allItemPopular,
        builder: (context,  snapshot) {
          if (!snapshot.hasData || snapshot.hasError)
            return Center(
              child: CircularProgressIndicator(),
            );
          // List<ItemPopular> popularList = snapshot.data!;
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.62, crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 30),
            itemBuilder: (BuildContext context, int index) => _itemPopular(snapshot.data![index]),
          );
        });
  }

  GestureDetector _itemPopular(ItemPopular itemPopular) {
    return GestureDetector(
      onTap: () => Get.to(DetailScreen(itemPopular: itemPopular)),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: Alignment(0.7, 0.95),
              children: [
                /* Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      // color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(itemPopularDemo.imageUrl!),
                      )),
                ) */
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.r),
                  child: Image.network(itemPopular.posterPath!),
                ),
                Text(
                  itemPopular.releaseDate!,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Text(
                    itemPopular.originalTitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
