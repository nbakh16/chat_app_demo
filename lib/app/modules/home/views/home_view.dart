import 'package:chat_app_demo/app/data/config/theme/color.dart';
import 'package:chat_app_demo/app/data/config/theme/style.dart';
import 'package:chat_app_demo/app/modules/home/views/tabs/call_tab.dart';
import 'package:chat_app_demo/app/modules/home/views/tabs/chat_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: kWhite,
            title: const Text('Pro Chat'),
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * .15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.r),
                            border: Border.all(
                              width: 1.75,
                              color: Colors.black45,
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: kTextLightColor,
                                ),
                                const SizedBox(width: 8),
                                Text('Search',
                                    style: kBodyLarge.copyWith(
                                        color: kTextLightColor)),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TabBar(
                    labelColor: Color(0xff0EAB8B),
                    labelStyle: TextStyle(
                        color: Color(0xff0EAB8B),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xff0EAB8B),
                    tabs: [
                      Tab(text: "Chat"),
                      Tab(text: "Call"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [ChatTab(), CallTab()],
          ),
        ),
      ),
    );
  }
}
