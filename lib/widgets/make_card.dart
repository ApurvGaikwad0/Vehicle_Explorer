import 'package:flutter/material.dart';
import '../model/make_model.dart';
import 'custom_image.dart';
import 'make_title.dart';

class MakeCard extends StatelessWidget {
  final VehicleMake make;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;

  const MakeCard({
    super.key,
    required this.make,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('makeList${make.makeId}'),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        title: Stack(
          alignment: Alignment.center,
          children: [
            CustomImage(imagePath: make.image),
            Positioned(
              bottom: 4,
              right: 4,
              child: InkWell(
                onTap: onFavoriteToggle,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.black54,
                  child: Icon(
                    key: Key('likeIcon${make.makeId}'),
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        subtitle: MakeTitle(title: make.makeName),
        onTap: onTap,
      ),
    );
  }
}
