import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/vehicle_provider.dart';
import '../widgets/custom_fab.dart';
import '../helpers/helpers.dart';
import '../model/make_model.dart';
import 'make_detail_page.dart';
import '../widgets/make_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> selectedMakes = [];
  final Helpers _helpers = Helpers();

  @override
  void initState() {
    super.initState();
    Provider.of<VehicleProvider>(context, listen: false).fetchMakes();
    _helpers.loadSelectedMakes().then((favs) {
      setState(() => selectedMakes = favs);
    });
  }

  void _toggleFavorite(VehicleMake make) {
    setState(() {
      if (selectedMakes.contains(make.makeName)) {
        selectedMakes.remove(make.makeName);
      } else {
        selectedMakes.add(make.makeName);
      }
      _helpers.saveSelectedMakes(selectedMakes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vehicle Makes')),
      floatingActionButton: const CustomFloatingActionButton(),
      body: Consumer<VehicleProvider>(
        builder: (ctx, prov, _) {
          if (prov.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final makes = prov.makes;
          return ListView.builder(
            itemCount: makes.length,
            itemBuilder: (_, i) {
              final make = makes[i];
              final isFav = selectedMakes.contains(make.makeName);

              return MakeCard(
                make: make,
                isFavorite: isFav,
                onFavoriteToggle: () => _toggleFavorite(make),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MakeDetailPage.routeName,
                    arguments: make,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
