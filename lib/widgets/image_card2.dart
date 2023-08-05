import 'package:flutter/material.dart';
import 'package:grocery_list_app/cartmodels/cart_models.dart';
import 'package:grocery_list_app/db/cart_db.dart';

import '../costants.dart';

class ImageCard2 extends StatelessWidget {
  final Map pObj;
  // final String rating;
  final String thumbnailUrl;
  final VoidCallback? onPressed;
  final VoidCallback? onCart;
  final int? index;
  const ImageCard2({
    super.key,
    this.index,
    // required this.rating,
    required this.thumbnailUrl,
    this.onCart,
    this.onPressed,
    required this.pObj,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            // width: 300,
            // height: 180,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(
                    0.0,
                    10.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply,
                ),
                image: NetworkImage(thumbnailUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            bottom: 30, // Adjust the bottom position as per your requirement
            left: 20,
            right: 5,
            // Adjust the left position as per your requirement
            child: Text(
              "",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Positioned(
            bottom: 40, // Adjust the bottom position as per your requirement
            left: 30,

            child: Text(
              "${pObj["qty"]}${pObj["unit"]}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 15, // Adjust the bottom position as per your requirement
            left: 30,
            // right: 100,
            child: Text(
              pObj["price"],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 170, // Adjust the top position as per your requirement
            left: 120,
            child: InkWell(
              onTap: onCart,
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: TColor.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: IconButton( 
                      onPressed: () {
                        // final cart = CartModels(
                        //     id: DateTime.now()
                        //         .millisecondsSinceEpoch
                        //         .toString(),
                        //     image: thumbnailUrl,
                        //     title: "name");
                        // CartDb.singleton.insertCart(cart);
                        // print(cart.toString());
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
            ),
          ),
          const Positioned(
            bottom:
                180, //  top: 150, // Adjust the top position as per your requirement
            left: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.favorite_outline,
                  size: 30,
                  color: Colors.red, // Outer fill color
                ),
                Opacity(
                  opacity: 0.8, // Adjust the opacity to control the fill level
                  child: Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.red, // Inner fill color
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
