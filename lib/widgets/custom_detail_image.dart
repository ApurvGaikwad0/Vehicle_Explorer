import 'package:flutter/material.dart';

class CustomDetailImage extends StatelessWidget {
  final String imagePath;
  const CustomDetailImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Image.asset(imagePath,
        fit: BoxFit.cover, width: size.width, height: size.height * 0.5);
  }
}
