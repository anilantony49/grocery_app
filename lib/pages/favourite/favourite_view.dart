import 'package:flutter/material.dart';
import 'package:grocery_list_app/widgets/image_card.dart';
import 'package:grocery_list_app/widgets/imagecard3.dart';

import '../../costants.dart';
import '../../models/homeview/single_recipe.dart';

import '../../models/homeview/single_recipe_api.dart';
import '../../widgets/image_card4.dart';
import '../../widgets/round_button.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  bool _isLoading = true;
  List<SingleRecipe>? exclusive;

  List listArr = [
    {"qty": "325", "unit": "gr, Price", "price": "\$1.49"},
    {"qty": "355", "unit": "gr, Price", "price": "\$1.99"},
    {"qty": "2", "unit": "kg, Price", "price": "\$15.99"},
    {"qty": "325", "unit": "gr, Price", "price": "\$4.99"},
    {"qty": "325", "unit": "gr, Price", "price": "\$4.49"}
  ];
  @override
  void initState() {
    super.initState();

    getExclusive();
  }

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    itemCount: exclusive!.length < 5 ? exclusive!.length : 5,
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                    itemBuilder: (context, index) {
                      var pObj = listArr[index] as Map? ?? {};
                      return ImageCard4(
                        title: exclusive![index].name,
                        thumbnailUrl: exclusive![index].images,
                        pObj: pObj,
                      );
                    }),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundButton(title: "Add All To Cart", onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
