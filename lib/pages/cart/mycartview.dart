import 'package:flutter/material.dart';

import '../../cartmodels/cart_models.dart';
import '../../costants.dart';
import '../../db/cart_db.dart';
import '../../models/homeview/single_recipe.dart';

import '../../models/homeview/single_recipe_api.dart';

import '../../widgets/image_card5.dart';
import 'checkout_view.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  bool _isLoading = true;
  List<SingleRecipe>? exclusive;

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

  List cartArr = [
    {"qty": 1, "unit": "1kg, Price", "price": 2.99},
    {"qty": 1, "unit": "4pcs, Price", "price": 1.99},
    {"qty": 1, "unit": "7pcs, Price", "price": 1.99},
    {"qty": 1, "unit": "250gm, Prices", "price": 3.99},
    {"qty": 1, "unit": "250gm, Prices", "price": 3.99}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "My Cart",
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
                    itemCount: exclusive!.length < 4 ? exclusive!.length : 4,
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                    itemBuilder: (context, index) {
                      var pObj = cartArr[index] as Map? ?? {};
                      return ImageCard5(
                        title: exclusive![index].name,
                        thumbnailUrl: exclusive![index].images,
                        pObj: pObj,
                      );
                    }),

            // ValueListenableBuilder(
            //     valueListenable: CartDb().cartListNotifier,
            //     builder: (BuildContext context, List<CartModels> newValue,
            //         Widget? _) {
            //       return CartDb
            //               .singleton.cartListNotifier.value.isNotEmpty
            //           ? Column(
            //               children: [
            //                 Expanded(
            //                   child:
            //                 )
            //               ],
            //             )
            //           : const Center(
            //               child: Text(
            //                 "Tap the '+' icon to add new items",
            //                 style: TextStyle(
            //                     fontSize: 20, color: Colors.grey),
            //               ),
            //             );
            //     })
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    showCheckout();
                  },
                  height: 60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19)),
                  minWidth: double.maxFinite,
                  elevation: 0.1,
                  color: TColor.primary,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go to Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: const Text(
                          "\$10.96",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showCheckout() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        context: context,
        builder: (context) {
          return const CheckoutView();
        });
  }
}
