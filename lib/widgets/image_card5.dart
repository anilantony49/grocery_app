import 'package:flutter/material.dart';

import '../costants.dart';

class ImageCard5 extends StatelessWidget {
  final String title;
  final Map pObj;
  final String thumbnailUrl;
  final VoidCallback? onPressed;
  final VoidCallback? onCart;
  const ImageCard5(
      {super.key,
      required this.title,
      required this.thumbnailUrl,
      this.onCart,
      this.onPressed,
      required this.pObj});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: InkWell(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              height: 100,
              width: 100,
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Image.asset(
                          "assets/img/close.png",
                          width: 15,
                          height: 15,
                          color: TColor.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${pObj["unit"]}",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: TColor.placeholder.withOpacity(0.5),
                                width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/subtack.png",
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        pObj["qty"].toString(),
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: TColor.placeholder.withOpacity(0.5),
                                width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/add_green.png",
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${pObj["price"]}",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
