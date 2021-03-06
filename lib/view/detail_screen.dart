import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_mobile_app/controller/detail_page_controller.dart';

import '../model/item_cast.dart';
import '../model/item_popular_model.dart';

class DetailScreen extends StatefulWidget {
  ItemPopular? itemPopular;
  DetailScreen({this.itemPopular});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DetailPageController _detailPageController = Get.put(DetailPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.black), actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Icon(Icons.restore_from_trash_outlined),
        )
      ]),
      body: Stack(children: [
        Image.network(
          widget.itemPopular!.backdropPath!,
          fit: BoxFit.cover,
          height: Get.height,
        ),
        Container(
          height: Get.height,
          color: Colors.white.withOpacity(0.8),
        ),
        _body(),
      ]),
    );
  }

  ListView _body() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(
          height: 20.h,
        ),
        _header(),
        _cast(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(widget.itemPopular!.overview!, style: TextStyle(fontSize: 16.sp))],
          ),
        )
      ],
    );
  }

  Padding _cast() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cast"),
          // Container(
          //   height: 160.h,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: listItemCast.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return _itemCast(index);
          //     },
          //   ),
          // ),

          FutureBuilder<List<ItemCast>>(
              future: _detailPageController.getCastInfo(widget.itemPopular!.id!.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(snapshot.data!.length, (index) => _itemCast(snapshot.data![index])),
                    ),
                  );
                if (snapshot.hasError) return Text(snapshot.error.toString());
                return Center(child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }

  Container _itemCast(ItemCast itemCast) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      width: 75.w,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            itemCast.profilePath!,
            height: 100.h,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          itemCast.name!,
          style: TextStyle(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          itemCast.character!,
          style: TextStyle(fontSize: 10.sp),
        )
      ]),
    );
  }

  Padding _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                widget.itemPopular!.posterPath!,
                fit: BoxFit.cover,
                width: 150.w,
                height: 150.h,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.itemPopular!.originalTitle!,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text("Xuat Ban")),
                  Expanded(flex: 2, child: Text(widget.itemPopular!.releaseDate!)),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Expanded(flex: 1, child: Text("Th??? lo???i")), Expanded(flex: 2, child: Text("t??i y??u em ?????n nay ch???ng c?? th??? ng???n l???a t??nh ch??a h???n ???? t??n phai, "))],
              )
            ],
          ),
        )
      ]),
    );
  }
}
