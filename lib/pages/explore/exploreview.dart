import 'package:flutter/material.dart';
import 'package:grocery_list_app/widgets/image_card.dart';
import 'package:grocery_list_app/widgets/imagecard3.dart';

import '../../costants.dart';
import '../../models/homeview/single_recipe.dart';
import '../../models/homeview/single_recipe_api.dart';

import '../../widgets/image_card1.dart';
import 'exploredetailview.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  TextEditingController txtSearch = TextEditingController();
  List<String> title = [
    "Frash Fruits & Vegetable",
    "Cooking Oil & Ghee",
    "Meat & Fish",
    "Bakery & Snacks",
    "Dairy & Eggs",
    "Beverages",
  ];
  // List findProductArr = [
  //   {
  //     "name": "Frash Fruits & Vegetable",
  //     "icon": "assets/img/frash_fruits.png",
  //     "color": const Color(0xff53B175),
  //   },
  //   {
  //     "name": "Cooking Oil & Ghee",
  //     "icon": "assets/img/cooking_oil.png",
  //     "color": const Color(0xffF8A44C),
  //   },
  //   {
  //     "name": "Meat & Fish",
  //     "icon": "assets/img/meat_fish.png",
  //     "color": const Color(0xffF7A593),
  //   },
  //   {
  //     "name": "Bakery & Snacks",
  //     "icon": "assets/img/bakery_snacks.png",
  //     "color": const Color(0xffD3B0E0),
  //   },
  //   {
  //     "name": "Dairy & Eggs",
  //     "icon": "assets/img/dairy_eggs.png",
  //     "color": const Color(0xFFFDE598),
  //   },
  //   {
  //     "name": "Beverages",
  //     "icon": "assets/img/beverages.png",
  //     "color": const Color(0xffB7DFF5),
  //   }
  // ];
  List<SingleRecipe>? exclusive;

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    getExclusive();
    // getGenericFood();
  }

  @override
  void dispose() {
    // Clean up resources, such as controllers, when the widget is disposed
    txtSearch.dispose();
    super.dispose();
  }

  // Future<void> getExclusive() async {
  //   try {
  //     List<SingleRecipe>? exclusiveData =
  //         await ExclusiveOfferApi.getExclusive();
  //     if (mounted) {
  //       setState(() {
  //         exclusive = exclusiveData;
  //         _isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     // Handle errors if necessary
  //     print("Error while fetching exclusive offers: $e");
  //     if (mounted) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

  Future<void> getExclusive() async {
    exclusive = await ExclusiveOfferApi.getExclusive();
    setState(() {
      _isLoading = false;
    });
    print(exclusive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Find Products",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    "Search Store",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      crossAxisSpacing: 8, // Spacing between items horizontally
                      // mainAxisSpacing: 4, // Spacing between items vertically
                    ),
                    itemCount: exclusive!.length < 6 ? exclusive!.length : 6,
                    itemBuilder: (context, index) {
                      // var eObj = title[index] as Map? ?? {};
                      return ImageCard3(
                        thumbnailUrl: exclusive![index].images,
                        index: title[index],
                         onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExploreDetailView(
                                eObj: title[index],
                              )),
                    );
                  },
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
