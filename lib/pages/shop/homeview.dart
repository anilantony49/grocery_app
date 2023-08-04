import 'package:flutter/material.dart';
import 'package:grocery_list_app/models/homeview/single_recipe_api.dart';
import 'package:grocery_list_app/product_cell2.dart';

import '../../costants.dart';
import '../../models/homeview/single_recipe.dart';
import '../../product_details.dart';
import '../../widgets/categorycell.dart';
import '../../widgets/image_card.dart';

import '../../widgets/product_cell.dart';
import '../../widgets/section_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<SingleRecipe>? exclusive;

  bool _isLoading = true;

  TextEditingController txtSearch = TextEditingController();

  List bestSellingArr = [
    {
      "name": "Bell Pepper Red",
      "icon": "assets/img/bell_pepper_red.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$2.99"
    },
    {
      "name": "Ginger",
      "icon": "assets/img/ginger.png",
      "qty": "250",
      "unit": "gm, Prices",
      "price": "\$3.99"
    }
  ];

  List groceriesArr = [
    {
      "name": "Pulses",
      "icon": "assets/img/pulses.png",
      "color": Color(0xffF8A44C),
    },
    {
      "name": "Rice",
      "icon": "assets/img/rice.png",
      "color": Color(0xff53B175),
    }
  ];

  List listArr = [
    {
      "name": "Beef Bone",
      "icon": "assets/img/beef_bone.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    },
    {
      "name": "Broiler Chicken",
      "icon": "assets/img/broiler_chicken.png",
      "qty": "1",
      "unit": "kg, Prices",
      "price": "\$4.99"
    }
  ];

  @override
  void initState() {
    super.initState();

    getExclusive();
    // getGenericFood();
  }

  Future<void> getExclusive() async {
    exclusive = await ExclusiveOfferApi.getExclusive();
    setState(() {
      _isLoading = false;
    });
    print(exclusive);
  }

  //   Future<void> getGenericFood() async {
  //   genericfood = await GenericFoodApi.getGenericFood();
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   print(genericfood);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/color_logo.png",
                    width: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/location.png",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Cochi, Kerala",
                    style: TextStyle(
                        color: TColor.darkGray,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                      color: const Color(0xffF2F3F2),
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: txtSearch,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/img/search.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search Store",
                      hintStyle: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    width: double.maxFinite,
                    height: 115,
                    decoration: BoxDecoration(
                        color: const Color(0xffF2F3F2),
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/img/banner_top.png",
                      fit: BoxFit.cover,
                    )),
              ),
              SectionView(
                title: "Single Recipe",
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                onPressed: () {},
              ),
              SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                child: Row(
                //  crossAxisAlignment: CrossAxisAlignment.center, // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(
                      height: 230,
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ImageCard(
                              title: exclusive![0].name,
                              cookTime: exclusive![0].totalTime,
                              rating: exclusive![0].rating.toString(),
                              thumbnailUrl: exclusive![0].images,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductDetails(),
                                    ));
                              },
                            )),
                  SizedBox(
                      height: 230,
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ImageCard(
                              title: exclusive![1].name,
                              cookTime: exclusive![1].totalTime,
                              rating: exclusive![1].rating.toString(),
                              thumbnailUrl: exclusive![1].images,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductDetails2(),
                                    ));
                              },
                            )),
                ]),
              ),
              SectionView(
                title: "Best Setting",
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                onPressed: () {},
              ),
              SizedBox(
                height: 230,
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: exclusive!.length,
                        itemBuilder: (context, index) {
                          return ImageCard(
                            title: exclusive![index].name,
                            cookTime: exclusive![index].totalTime,
                            rating: exclusive![index].rating.toString(),
                            thumbnailUrl: exclusive![index].images,
                          );
                        }),
              ),
              SectionView(
                title: "Groceries",
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                onPressed: () {},
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: groceriesArr.length,
                    itemBuilder: (context, index) {
                      var pObj = groceriesArr[index] as Map? ?? {};

                      return CategoryCell(
                        pObj: pObj,
                        onPressed: () {},
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: listArr.length,
                    itemBuilder: (context, index) {
                      var pObj = listArr[index] as Map? ?? {};

                      return ProductCell(
                        pObj: pObj,
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
