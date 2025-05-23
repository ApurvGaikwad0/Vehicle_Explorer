import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/vehicle_provider.dart';
import '../helpers/helpers.dart';
import '../widgets/custom_image.dart';
import '../widgets/make_title.dart';
import '../pages/make_detail_page.dart';

class FavoriteMakePage extends StatefulWidget {
  const FavoriteMakePage({super.key});
  static const routeName = '/favorite-makes';

  @override
  State<FavoriteMakePage> createState() => _FavoriteMakePageState();
}

class _FavoriteMakePageState extends State<FavoriteMakePage> {
  List<String> selectedMakes = [];
  final Helpers _helpers = Helpers();

  @override
  void initState() {
    super.initState();
    _helpers.loadSelectedMakes().then((favs) {
      setState(() => selectedMakes = favs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('My Favorite Makes'))),
      body: FutureBuilder<void>(
        future:
            Provider.of<VehicleProvider>(context, listen: false).fetchMakes(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final makes = Provider.of<VehicleProvider>(context, listen: false)
              .makes
              .where((m) => selectedMakes.contains(m.makeName))
              .toList();
          if (makes.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }
          return GridView.builder(
            key: const Key('favoriteMakeGrid'),
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: makes.length,
            itemBuilder: (_, i) {
              final m = makes[i];
              return Card(
                key: Key('favMake${m.makeId}'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, MakeDetailPage.routeName,
                      arguments: m),
                  child: Column(children: [
                    Stack(alignment: Alignment.center, children: [
                      CustomImage(imagePath: m.image),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedMakes.remove(m.makeName);
                              _helpers.saveSelectedMakes(selectedMakes);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: Colors.black54,
                            child:
                                const Icon(Icons.favorite, color: Colors.red),
                          ),
                        ),
                      ),
                    ]),
                    MakeTitle(title: m.makeName),
                  ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
