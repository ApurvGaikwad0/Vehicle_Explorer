import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  const CustomImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Image.asset(imagePath, fit: BoxFit.cover, width: width, height: 120);
  }
}
