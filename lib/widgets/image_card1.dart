import 'package:flutter/material.dart';

import '../costants.dart';

class ImageCard2 extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback? onPressed;
  final VoidCallback? onCart;
  const ImageCard2({
    super.key,
    this.onCart,
    this.onPressed, required this.image, required this.label,
  });
  @override
  Widget build(BuildContext context) {
   return InkWell(
  onTap: onPressed,
  child: Container(
    width: 100,
    margin: EdgeInsets.symmetric(horizontal: 100),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: TColor.placeholder.withOpacity(0.5), width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column( // Wrap the image and label in a Column widget
      mainAxisAlignment: MainAxisAlignment.center, // Center the contents vertically
      children: [
        Image.asset(
          image, // Replace with the actual path to your image
          fit: BoxFit.cover, // Choose an appropriate fit for the image
        ),
        SizedBox(height: 8), // Add some spacing between the image and the label
        Text(
          label, // Replace with your actual label text
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  ),
);


}} 