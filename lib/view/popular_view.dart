import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_mobile_app/respository/my_home_page_controller.dart';
import 'package:provider/provider.dart';

import '../model/item_popular_model.dart';
import 'detail_screen.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override 
  Widget build(BuildContext context) {
    var popularList = Provider.of<List<ItemPopular>>(context);
    return popularList != null
        ? GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            itemCount: popularList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.62, crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 30),
            itemBuilder: (BuildContext context, int index) => _itemPopular(popularList[index]),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
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
