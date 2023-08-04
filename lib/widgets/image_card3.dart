import 'package:flutter/material.dart';

class ImageCard3 extends StatelessWidget {
  final String thumbnailUrl;
  final VoidCallback? onPressed;
  final VoidCallback? onCart;
  final String index;
  const ImageCard3({
    super.key,
    required this.index,
    required this.thumbnailUrl,
    this.onCart,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
          Positioned(
            bottom: 30, // Adjust the bottom position as per your requirement
            left: 20,
            right: 5,
            // Adjust the left position as per your requirement
            child: Text(
              index,
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
          // Positioned(
          //   bottom: 40, // Adjust the bottom position as per your requirement
          //   left: 30,

          //   // child: Text(
          //   //   "${pObj["qty"]}${pObj["unit"]}",
          //   //   style: const TextStyle(
          //   //       color: Colors.white,
          //   //       fontSize: 14,
          //   //       fontWeight: FontWeight.w500),
          //   // ),
          // ),
          // Positioned(
          //   bottom: 15, // Adjust the bottom position as per your requirement
          //   left: 30,
          //   // // right: 100,
          //   // child: Text(
          //   //   pObj["price"],
          //   //   style: TextStyle(
          //   //       color: Colors.white,
          //   //       fontSize: 18,
          //   //       fontWeight: FontWeight.w600),
          //   // ),
          // ),
        ],
      ),
    );
  }
}
