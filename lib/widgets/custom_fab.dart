import 'package:flutter/material.dart';
import '../pages/favorite_make_page.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          Navigator.of(context).pushNamed(FavoriteMakePage.routeName),
      child: const Icon(Icons.favorite),
    );
  }
}
