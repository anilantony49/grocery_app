import 'package:flutter/material.dart';

import '../../costants.dart';
import '../../models/homeview/single_recipe.dart';
import '../../models/homeview/single_recipe_api.dart';

import '../../widgets/image_card2.dart';

class ExploreDetailView extends StatefulWidget {
  final String eObj;

  const ExploreDetailView({
    super.key,
    required this.eObj,
  });

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {
  List listArr = [
    {"qty": "355", "unit": "gr, Price", "price": "\$1.99"},
    {"qty": "325", "unit": "gr, Price", "price": "\$1.49"},
    {"qty": "2", "unit": "kg, Price", "price": "\$15.99"},
    {"qty": "2", "unit": "kg, Price", "price": "\$15.49"},
    {"qty": "325", "unit": "gr, Price", "price": "\$4.99"},
    {"qty": "325", "unit": "gr, Price", "price": "\$4.49"}
  ];
  // List<String> title = [
  //   "Frash Fruits & Vegetable",
  //   "Cooking Oil & Ghee",
  //   "Meat & Fish",
  //   "Bakery & Snacks",
  //   "Dairy & Eggs",
  //   "Beverages",
  // ];
  List<SingleRecipe>? exclusive;

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    getExclusive();
  }

  // @override
  // void dispose() {
  //   // Clean up resources, such as controllers, when the widget is disposed
  //   txtSearch.dispose();
  //   super.dispose();
  // }

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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/img/filter_ic.png",
                width: 20,
                height: 20,
              )),
        ],
        title: Text(
          widget.eObj,
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: _isLoading
          ? const Center(child:CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 8, // Spacing between items horizontally
                mainAxisSpacing: 4, // Spacing between items vertically
              ),
              itemCount: exclusive!.length < 6 ? exclusive!.length : 6,
              itemBuilder: (context, index) {
                var pObj = listArr[index] as Map? ?? {};
                return ImageCard2(
                  pObj: pObj,
                  thumbnailUrl: exclusive![index].images,
                );
              },
            ),
    );
  }
}
