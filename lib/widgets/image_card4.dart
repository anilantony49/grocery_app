import 'package:flutter/material.dart';

import '../costants.dart';

class ImageCard4 extends StatelessWidget {
  final String title;
  final Map pObj;
  final String thumbnailUrl;
  final VoidCallback? onPressed;
  final VoidCallback? onCart;
  const ImageCard4(
      {super.key,
      required this.title,
      required this.thumbnailUrl,
      this.onCart,
      this.onPressed,
      required this.pObj});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                width: 60,
                height: 60,
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
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${pObj["qty"]}${pObj["unit"]}",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                pObj["price"],
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                "assets/img/next.png",
                height: 15,
                color: TColor.primaryText,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black26,
          height: 1,
        ),
      ],
    );
  }
}
