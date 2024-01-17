import 'package:chat_app_demo/app/modules/home/views/tabs/call_tab.dart';
import 'package:chat_app_demo/app/modules/home/views/tabs/chat_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: const Color(0xffFFFFFF),
            title: Text('Message'),
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
                            border: Border.all(
                              width: 1,
                              color: Colors.black45,
                            ),
                          ),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                Text('Search for a name'),
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
