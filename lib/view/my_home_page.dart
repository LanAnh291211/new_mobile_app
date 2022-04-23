import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'new_screen.dart';
import 'popular_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    print(Get.height);
    print(Get.width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _tabBar(),
        _tabBarView(),
      ]),
    );
  }

  _tabBar() {
    return Padding(
      padding: EdgeInsets.only(top: 80.h, left: 25.w),
      child: TabBar(
        controller: _tabController,
        // labelStyle: ,
        tabs: [
          Text("Popular"),
          Text("NowPlaying"),
          Text("Up Coming"),
          Text("Top Rate"),
        ],
        indicatorColor: Colors.black,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
        labelPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 2.h),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black.withOpacity(0.5),
        isScrollable: true,
      ),
    );
  }

  _tabBarView() {
    return Expanded(
      child: TabBarView(controller: _tabController, children: [
        PopularView(),
        Container(
          color: Colors.red,
          child: Center(
              child: TextButton(
            onPressed: () =>Get.to(NewScreen()),
            child: Text("Qua man hinh khac"),
          )),
        ),
        Container(
          color: Colors.grey,
        ),
        Container(
          color: Colors.black,
        ),
      ]),
    );
  }
}
