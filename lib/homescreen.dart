import 'package:flutter/material.dart';
import 'package:grocery_list_app/pages/account/account_view.dart';

import 'costants.dart';
import 'pages/explore/exploreview.dart';
import 'pages/homeview.dart';

import 'pages/mycartview.dart';
import 'pages/myfavoritesview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
 

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
        setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: TabBarView(controller: controller, children: const [
        HomeView(),
        ExploreView(),
        MyCartView(),
        FavoritesView(),
        AccountView(),
      ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 3, offset: Offset(0, -2))
            ]),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
              controller: controller,
              indicatorColor: Colors.transparent,
              indicatorWeight: 1,
              labelColor: TColor.primary,
              labelStyle: TextStyle(
                color: TColor.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: TColor.primaryText,
              unselectedLabelStyle: TextStyle(
                color: TColor.primaryText,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Tab(
                  text: "Shop",
                  icon: Image.asset(
                    "assets/img/store_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 0 ? TColor.primary : TColor.primaryText,
                  ),
                ),
                Tab(
                  text: "Explore",
                  icon: Image.asset(
                    "assets/img/explore_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 1 ? TColor.primary : TColor.primaryText,
                  ),
                ),
                Tab(
                  text: "Cart",
                  icon: Image.asset(
                    "assets/img/cart_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 2 ? TColor.primary : TColor.primaryText,
                  ),
                ),
                Tab(
                  text: "Favourite",
                  icon: Image.asset(
                    "assets/img/fav_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 3 ? TColor.primary : TColor.primaryText,
                  ),
                ),
                Tab(
                  text: "Account",
                  icon: Image.asset(
                    "assets/img/account_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 4 ? TColor.primary : TColor.primaryText,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
